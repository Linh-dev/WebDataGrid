


function callFadeIn(elem) {
    elem.style.display = "block";
    if ($util.IsIE) {
        elem.style.filter = "alpha(opacity = 0)";
        animationInterval = setInterval(function () { FadeInIE(elem); }, 10);
    }
    else {
        elem.style.opacity = 0;
        animationInterval = setInterval(function () { FadeIn(elem); }, 10);
    }
}
function callFadeOut(elem) {
    if (!elem || elem.style.display == "none")
        return;
    if ($util.IsIE)
        fadeOutAnimationInterval = setInterval(function () { FadeOutIE(elem); }, 10);
    else
        fadeOutAnimationInterval = setInterval(function () { FadeOut(elem); }, 10);

}


function FadeOut(elem) {
    opacity -= 0.05;
    elem.style.opacity = opacity;

    if (elem.style.opacity <= 0) {
        clearInterval(fadeOutAnimationInterval);
        elem.style.display = "none";
        opacity = 1;
    }
}

function FadeOutIE(elem) {
    alpha -= 10;
    elem.style.filter = "alpha(opacity = " + alpha + ")";

    if (alpha <= 0) {
        clearInterval(fadeOutAnimationInterval);
        elem.style.display = "none";
        alpha = 100;
    }
}


function FadeInIE(elem) {
    fadingInOpacity += 10;
    elem.style.filter = "alpha(opacity = " + fadingInOpacity + ")";
    if (fadingInOpacity >= 100) {
        clearInterval(animationInterval);
        fadingInOpacity = 0;
    }
}
function FadeIn(elem) {
    fadingInOpacity += 0.05;
    elem.style.opacity = fadingInOpacity;

    if (elem.style.opacity >= 1) {
        clearInterval(animationInterval);
        fadingInOpacity = 0;
    }
}