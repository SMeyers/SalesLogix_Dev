/*globals Sage, dojo, dojox, dijit, Simplate, window, Sys, define */
define(['dijit/layout/TabContainer',
        'dojo/topic',
        'dojo/_base/lang',
        'dojo/_base/declare',
        'dojo/on'
],
function (TabContainer, topic, lang, declare, on) {
    var groupTabPane = declare("Sage.UI.GroupTabPane", TabContainer, {
        useMenu: false,
        _children: null,
        _drawnChildren: {},
        _initialLoadFinished: false,
        constructor: function (options) {
            this._children = [];
            this.inherited(arguments);
        },
        resize: function() {
            var children = this.getChildren();
            this.inherited(arguments);
            if(this._initialLoadFinished && children.length > 1) {
                // The buttons may need to be enabled again!
                if(!this._drawnChildren[children[1].id]) {
                    this.tablist._leftBtn.setDisabled(false);
                }
                if(!this._drawnChildren[children[children.length-1].id]) {
                    this.tablist._rightBtn.setDisabled(false);
                }
            }
        },
        addChild: function (widget) {
            // TODO: Call addChildren instead
            this._children.push(widget);
            topic.publish(this.id+"-addChild", widget, this._children.length);
            this._setupChild(widget);
            
            if(!this.selectedChildWidget){
                this.selectChild(widget);
            }

            if (this.doLayout) {
                this.layout();
            }
            
            this.onAddChildrenComplete();
        },
        addChildren: function (widgets, selectedTab) {

            var selectedTabIndex = 1; // 0 would be Lookup Results tab, which already exists
            for (i = 0; i < widgets.length; i++) {
                if(selectedTab == widgets[i]) {
                    selectedTabIndex = i;
                }


                            if (this._started) {
                    this._children.push(widgets[i]);
                }
            }
            dojo.subscribe('/group/context/changed', lang.hitch(this, function(options) {
                if(!this._drawnChildren[options.current.CurrentGroupID]) {
                    var children = this.getChildren(),
                        stackController = dijit.byId('GroupTabs_tablist');
                                
                    for(var i = 1; i < children.length; i++) {
                        if(children[i].id == options.current.CurrentGroupID) {
                            stackController.onAddChild(children[i], 1);
                            this.onAddChildrenComplete(i-1, i);
                            break;
                        }
                    }
                    this._drawnChildren[options.current.CurrentGroupID] = true;
                }
            }));
            this.drawChildren(selectedTabIndex, 25);
            this._initialLoadFinished = true;
        },
        drawChildren: function(childStart, chunkLength, navigate) {
            var stackController = dijit.byId('GroupTabs_tablist'),
                children = this.getChildren(),
                endLength = (childStart + chunkLength);
            if(children.length <= 1) // This is only the Lookup Results group, so no need to continue
                return;
            if(endLength >= children.length) {
                childStart = (children.length - chunkLength - 1);
                endLength = children.length;
                                }
                                
            if(childStart < 1) {
                childStart = 1;
            }
            // The difference between navigating left/right is that left items should get added to the left
            if(navigate == 'left') {
                for(var i=(endLength-1); i >= childStart; i--) {
                    if(!this._drawnChildren[children[i].id]) {
                        stackController.onAddChild(children[i], 1);
                        this._drawnChildren[children[i].id] = true; // ensure this won't attempt to get drawn again
                        this._setupChild(children[i]);
                            }
                        }
            }
            else {
                for(var i=childStart; i < endLength; i++) {
                    if(!this._drawnChildren[children[i].id]) {
                        stackController.onAddChild(children[i]);
                        this._drawnChildren[children[i].id] = true; // ensure this won't attempt to get drawn again
                        this._setupChild(children[i]);
                    }
                }
            }
                            if (this.doLayout) {
                if(navigate) {
                    if(navigate == 'left') {
                        this.tablist._leftBtn.onClick(this.tablist._leftBtn);
                    }
                    else {
                        this.tablist._rightBtn.onClick(this.tablist._rightBtn);
                    }
                }
                else {
                                this.layout();
                            }
                var rightButtonClicked = null,
                    leftButtonClicked = null;
                if(endLength < children.length) {
                    this.tablist._rightBtn.setDisabled(false);
                    rightButtonClicked = on(this.tablist._rightBtn, 'click', lang.hitch(this, function() {
                        rightButtonClicked.remove();
                            
                        if(leftButtonClicked) {
                            leftButtonClicked.remove();
                        }
                        this.drawChildren(endLength, 10, 'right');
                    }));
                }
                if(childStart > 1) {
                    this.tablist._leftBtn.setDisabled(false);
                    leftButtonClicked = on(this.tablist._leftBtn, 'click', lang.hitch(this, function() {
                        leftButtonClicked.remove();
                        if(rightButtonClicked) {
                            rightButtonClicked.remove();
                        }
                        this.drawChildren((childStart - 10), 10, 'left');
                    }));
                }
            }
            // pass in the range of items added (offsetting Lookup Results Group) to only add menus to what is visible
            this.onAddChildrenComplete(childStart - 1, endLength - 1);
        },
        onAddChildrenComplete: function (start, end) {
        },
        getChildren: function () {
            /* overrides _WidgetBase getChildren */
            return this._children;
        },
        removeChildren: function () {
            var i = 0,
                widget;
            for (i = 0; i < this._children.length; i++) {
                widget = this._children[i];
                // Call a destroy only for Lookup Results and Groups that have been drawn
                if(i == 0 || this._drawnChildren[widget.id]) {
                topic.publish(this.id + "-removeChild", widget);// publish
                widget.destroyDescendants();
                }
            }

            this._children = [];
            this._drawnChildren = {};
            this.destroyDescendants();
            
            if (this.doLayout) {
                this.layout();
            }
        }
    });
    return groupTabPane;
});