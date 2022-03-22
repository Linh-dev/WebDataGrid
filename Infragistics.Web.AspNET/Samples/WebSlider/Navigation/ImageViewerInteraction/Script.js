function valueChanged(slider, args) {
    var val = slider.get_value();
    var iv = $find(webImageViewer_ClientId);
    iv.get_scrollAnimations().get_nextItemAnimation().moveItemIntoFocus(iv.get_items().getItem(val - 1));
    iv.set_selectedIndex(val - 1);
}    