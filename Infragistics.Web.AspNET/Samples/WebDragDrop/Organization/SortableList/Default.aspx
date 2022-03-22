<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

    <style type="text/css">
    
        #MyWishList
        {
    	    border-bottom:1px solid #CCCCCC;
    	    width:250px;
    	    margin:0px;
    	    padding:0px;
        }
    
        .item
        {
    	    list-style-type:none;
    	    height:65px;
        }
    
        .itemContainer
        {
    	    position:relative;
    	    border-top: 1px #CCCCCC solid;
    	    cursor: hand;
    	    background-color: #FFFFFF;
        }
    
        .itemImg
        {
    	    height:45px;
    	    padding-left: 10px;
    	    padding-top: 10px;
    	    padding-bottom: 10px;
        }
    
        .itemText
        {
    	    position:absolute; 
    	    top:27px; 
    	    padding-left: 20px;
    	    display:inline; 
    	    font-size: 11px; 
    	    font-family:Tahoma;
        }
    
        .itemStar
        {
    	    height:27px; 
    	    margin-top:18px; 
    	    vertical-align:top;
        }
    
        .itemIndex
        {
    	    height:27px;
    	    width:27px;
    	    position:absolute; 
    	    top:26px; 
    	    left:10px;
    	    font-size: 10px; 
    	    font-weight: bold;
    	    color: #959595;
        }
    
        .blankItem
        {
    	
        }
    
    </style>

    <script type="text/javascript">

        function MM_openBrWindow(theURL, winName, features) { //v2.0
            var startpos, endpos, intWidth, intHeight, top, left, length;

            // Get Width
            startpos = features.indexOf("width=") + 6;
            endpos = startpos;

            while ((features.charCodeAt(endpos) >= 48) && (features.charCodeAt(endpos) <= 57)) {
                endpos++;
            }

            intWidth = features.substring(startpos, endpos);

            // Get Height
            startpos = features.indexOf("height=") + 7;
            endpos = startpos;

            while ((features.charCodeAt(endpos) >= 48) && (features.charCodeAt(endpos) <= 57)) {
                endpos++;
            }

            intHeight = features.substring(startpos, endpos);

            // Now determine top and left positions (centering) based on height and width
            top = (screen.height - intHeight) / 2;
            left = (screen.width - intWidth) / 2;

            features += ", top=" + top + ", left=" + left;

            return window.open(theURL, winName, features);
        }

    </script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <div style="margin:10px; font-size:12px">
  <%= this.GetGlobalResourceObject("WebDragDrop","ChooseMarkUp")%>
    <asp:DropDownList ID="ddMarkUp" runat="server" AutoPostBack="false">
           <asp:ListItem Text="<%$ Resources:WebDragDrop, Default %>" Value="Default" />
           <asp:ListItem Text="<%$ Resources:WebDragDrop, Custom %>" Value="Custom"/>
    </asp:DropDownList>
  </div>
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
			<asp:ScriptReference Assembly="Infragistics4.Web.v21.2" Name="Infragistics.Web.UI.SharedScripts.igDragDrop.js" />
			<asp:ScriptReference Assembly="Infragistics4.Web.v21.2" Name="Infragistics.Web.UI.Scripts.5_igObjects.js" />
			<asp:ScriptReference Assembly="Infragistics4.Web.v21.2" Name="Infragistics.Web.UI.SharedScripts.igAnimation.js" />
        </Scripts>
    </asp:ScriptManagerProxy>
 
    <ul id="MyWishList" >
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <li class="item" index="<%# DataBinder.Eval(Container.DataItem, "DisplayIndex") %>">
                        <div class="itemContainer">
                        <img class="itemStar"  src="/SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/SortableList/star.png"/>
                        <span class="itemIndex" >
                            <%# DataBinder.Eval(Container.DataItem, "DisplayIndex") %>
                        </span>
                        <img class="itemImg" src="<%# DataBinder.Eval(Container.DataItem, "ImageUrl") %>" />
                        <div class="itemText" ><%# DataBinder.Eval(Container.DataItem, "Description") %></div>
                    </div>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
	 <div style="display:none">
       <li class="item" id="CustomItem">
              <div class="itemContainer">
              <img class="itemStar"  src="/SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/SortableList/star.png"/>
              <span class="itemIndex" >
              </span>
              <img id="customItem" src="/SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/SortableList/customImage.png" />
              <div class="itemText" >Infragistics</div>
          </div>
      </li>
   </div>
    <script type="text/javascript">

        Sys.Application.add_load(appLoaded);
        var _ddb, _slideAnimation, customItem;
        function appLoaded() {
            _ddb = new $IG.DragDropBehavior();
            _ddb.addSourceElement($get("MyWishList"));
            _ddb.addTargetElement($get("MyWishList"), true);
            _slideAnimation = new $IG.SlideItemAnimation();

            var events = _ddb.get_events();
            events.addDragStartHandler(dragStart);
            events.addDragMoveHandler(dragMove);
            events.addDragEndHandler(dragEnd);
        }

        function dragStart(sender, evntArgs) {
            var list = $get("MyWishList");
            var manager = evntArgs.get_manager();

            var listItem = resolveListItem(manager.get_sourceElement());
            if (listItem == null || _slideAnimation.get_isAnimating()) {
                evntArgs.set_cancel(true);
                return;
            }

            var blankListItem = document.createElement("li");
            blankListItem.className = "blankItem item";

            var dd = $get("<%=ddMarkUp.ClientID %>");

            var dragMarkUp = (dd.value == "Default") ? listItem.cloneNode(true) : $get('CustomItem');
            dragMarkUp.style.width = listItem.offsetWidth + "px";
            _ddb.set_currentElementDragMarkup(true);
            _ddb.set_dragMarkup(dragMarkUp);
            _ddb.set_dragMarkupOpacity(90);

            list.insertBefore(blankListItem, listItem);
            listItem.style.display = "none";
            _ddb.__startElem = blankListItem;
            manager.set_dataObject([listItem, blankListItem]);
        }

        function dragMove(sender, evntArgs) {
            var list = $get("MyWishList");
            var manager = evntArgs.get_manager();
            var items = manager.get_dataObject();

            var li = resolveListItem(manager.get_targetElement());
            if (li == null)
                return;

            var middle = Sys.UI.DomElement.getLocation(li).y + li.offsetHeight / 2;
            if (evntArgs.get_y() < middle)
                list.insertBefore(items[1], li);
            else {
                var item = items[1];
                var nextSibling = li.nextSibling;
                while (nextSibling != null && !nextSibling.tagName)
                    nextSibling = nextSibling.nextSibling;

                if (item.nextSibling)
                    list.insertBefore(item, nextSibling);
                else
                    list.appendChild(item);
            }
        }

        function dragEnd(sender, evntArgs) {
            if (_slideAnimation.get_isAnimating())
                return;
            var list = $get("MyWishList");
            var manager = evntArgs.get_manager();
            var items = manager.get_dataObject();
            _slideAnimation.onEnd = Function.createDelegate(items, dragDropAnimationEnde);
            _slideAnimation.play(manager.get_dragMarkupElement(), Sys.UI.DomElement.getLocation(items[1]));
        }

        function dragDropAnimationEnde() {
            var list = $get("MyWishList");
            var items = this;
            list.insertBefore(items[0], items[1]);
            items[0].style.display = "";
            if (items[1].parentNode)
                list.removeChild(items[1]);
            updateIndexes();
        }

        function resolveListItem(elem) {
            while (elem != null && elem.tagName != "LI")
                elem = elem.parentNode;
            return elem;
        }

        function updateIndexes() {
            var list = $get("MyWishList");
            var count = 0;
            for (var i = 0; i < list.childNodes.length; i++) {
                var li = list.childNodes[i];
                if (li.tagName) {
                    var val = li.index = count + 1;
                    // if(val < 10)
                    //    val= "&nbsp;" + val;
                    li.getElementsByTagName("span")[0].innerHTML = val;
                    count++;
                }
            }
        }

        $IG.SlideItemAnimation = function (elem) {
            $IG.SlideItemAnimation.initializeBase(this, [elem]);
            this._duration = 20;
        }

        $IG.SlideItemAnimation.prototype =
            {
                play: function (item, endPos) {
                    this._item = item;
                    this._startPos = Sys.UI.DomElement.getLocation(item);
                    this._endPos = endPos;
                    if ($util.IsIE)
                        this._endPos.x -= 15;
                    $IG.SlideItemAnimation.callBaseMethod(this, "play");
                },

                _calc2: function (end) {
                    return this._calc($IG.AnimationEquationType.EaseInOut, this._time, 0, end, this._duration);
                },

                _next: function () {
                    if (this._item.parentNode != document.body)
                        document.body.appendChild(this._item);

                    var x = this._calc2(this._startPos.x - this._endPos.x);
                    var y = this._calc2(this._startPos.y - this._endPos.y);

                    x = this._startPos.x - x;

                    y = this._startPos.y - y;

                    this._item.style.top = y + "px";
                    this._item.style.left = x + "px";

                    if (this._time >= this._duration) {
                        this._item.style.display = 'none';
                        // document.body.removeChild(this._item);
                        this.stop();
                    }
                }
            };

        $IG.SlideItemAnimation.registerClass("Infragistics.Web.UI.SlideItemAnimation", $IG.AnimationBase);

    </script>

</asp:Content>
