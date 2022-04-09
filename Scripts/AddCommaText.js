Type.registerNamespace('Test');
// Test.AddCommaBehavior class.
Test.AddCommaText = function (element)
{
    Test.AddCommaText.initializeBase(this, [element]);
}
Test.AddCommaText.prototype = {
    // Component lifecycle.	
    initialize: function ()
    {
        Test.AddCommaText.callBaseMethod(this, 'initialize');
        //add Event handlers
        $addHandlers(this.get_element(),
             {
                 keypress: this._onKeypress,
                 keyup: this._onKeyup
             },
             this);
    },
    dispose: function ()
    {
        $clearHandlers(this.get_element());
        Test.AddCommaText.callBaseMethod(this, 'dispose');
    },
    // Event handlers.
    _onKeypress: function (evt)
    {
        var code = evt.charCode;
        //prevent user entering characters other than number or backspace                                                      
        if ((code < 48 || code > 57) && code != 8)
        {
            evt.preventDefault();
        }
    },
    // Event handlers.
    _onKeyup: function (evt)
    {
        var number = this.get_element().value;
        number = number.replace(/,/g, '');
        var formatStr = '';
        //start formatting only the length of string > 3
        if (number.length > 3)
        {
            //alert(number.length);
            var mod = number.length % 3;
            if (mod > 0)
                formatStr = number.substring(0, mod);
            //start to add comma for every three numbers we get
            for (var i = 0; i < Math.floor(number.length / 3); i++)
            {
                if ((mod == 0) && (i == 0))
                    formatStr += number.substring(mod + 3 * i, mod + 3 * i + 3);
                else
                    formatStr += ',' + number.substring(mod + 3 * i, mod + 3 * i + 3);
            }
            this.get_element().value = formatStr;
        }
    }
}
// Inherit from Sys.UI.Control.
Test.AddCommaText.registerClass('Test.AddCommaText', Sys.UI.Control);