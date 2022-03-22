function valueChanged(slider, args) {
    //--------------------
    // get new and old values
    var oldVal = args.get_oldValue(), newVal = args.get_newValue();
    //--------------------
    // copy value to WebSlider2
    var slider2 = $find(webSlider2_ClientId);
    if (slider2)
        slider2.set_value(newVal);
    //--------------------
    // show new and old values to user
    var div = document.getElementById('outputChanged');
    if (div)
        div.innerHTML = 'ValueChanged: New=' + roundedValue(newVal) + ' Old=' + roundedValue(oldVal);
    //--------------------
    // check if page should be posted
    var autoPost = document.getElementById(autoPostBack_ClientId);
    if (autoPost && autoPost.checked && newVal >= 40 && newVal <= 60)
        args.set_postBack(1);
}

function valueChanging(slider, args) {
    //--------------------
    // get new and old values
    var oldVal = args.get_oldValue(), newVal = args.get_newValue();
    //--------------------
    // show new and old values to user
    var div = document.getElementById('outputChanging');
    if (div)
        div.innerHTML = 'ValueChanging: New=' + roundedValue(newVal) + ' Old=' + roundedValue(oldVal);
    //--------------------
    // check if event should be canceled
    var keepRange = document.getElementById(keepRange_ClientId);
    if (keepRange && keepRange.checked && (newVal < 10 || newVal > 80))
        args.set_cancel(true);
}

function roundedValue(val) {
    return Math.round(val * 10) / 10;
}

function setValue() {
    var slider = $find(webSlider2_ClientId);
    if (slider)
        slider.set_value(40);
}