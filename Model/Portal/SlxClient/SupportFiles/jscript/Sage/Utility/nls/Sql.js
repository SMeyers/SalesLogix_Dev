define([
        'Sage/LanguageList',
        'dojo/_base/lang'
],
function (LanguageList, lang) {
    var nls = {
        root: {
            InvalidApostropheCount: 'The number of apostrophes in the SQL IN clause is invalid.'
        }
    };
    return lang.mixin(LanguageList, nls);
});