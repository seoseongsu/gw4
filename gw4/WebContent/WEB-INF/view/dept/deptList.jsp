<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="/gw4/WEB-INF/css/tree/jquery.treeview.css"/>
<link rel="stylesheet" href="/gw4/WEB-INF/css/tree/screen.css"/>
<script src="/gw4/WEB-INF/js/jquery.js" type="text/javascript"></script>
<script src="/gw4/WEB-INF/js/jquery.cookie.js" type="text/javascript"></script>
<script src="/gw4/WEB-INF/js/jquery.treeview.js" type="text/javascript"></script>
<script type="text/javascript">
        $(function() {
            $("#tree").treeview({
                collapsed: true,
                animated: "medium",
                control:"#sidetreecontrol",
                persist: "location"
            });
        })
    </script>
</head>
<body>
<div id="sidetree">
    <div class="treeheader">
          
    </div>
    <div id="sidetreecontrol">
        <a href="?#">전체 닫기</a> | <a href="?#">전체 열기</a>
    </div>
    <ul id="tree">
        <li>
            <strong>첫번째 메뉴</strong>
            <ul>
                <li><a href="#">서브메뉴</a></li>
            </ul>
            </li>
        <li>
        <strong>두번째 메뉴</strong>
        <ul>
            <li><a href="#">첫번째 서브메뉴</a></li>
        </ul>
        <ul>
            <li>
                <a href="#">두번째 서브메뉴</a>
                <ul>
                    <li><a href="#">서브메뉴 속 첫번째 서브메뉴</a></li>
                </ul>
            </li>
        </ul>
        </li>
    </ul>
</div>
</body>

</html>