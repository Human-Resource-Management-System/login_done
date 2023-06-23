<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
  <style>
        /* CSS styles for the dashboard */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }

        #sidebar {
            background-color: #333; /* Dark gray */
            color: #fff;
            width: 200px;
            height: 100vh;
            padding: 5px;
            position: fixed;
        }

        #sidebar a {
            display: block;
            color: #fff;
            text-decoration: none;
            margin-bottom: 10px;
            padding: 10px;
            background-color: #555; /* Gray */
            transition: background-color 0.3s ease;
        }

        #sidebar a:hover {
            background-color: #777; /* Dark gray on hover */
        }

        #sidebar .sub-menu {
            display: none;
            padding-left:5px;
        }

        #sidebar .sub-menu a {
            padding-left: 5px;
        }

        #content {
            margin-left: 200px;
            padding: 30px;
        }
 h2 {
            color: #FFFFFF;
        }
h1 {
            color: #333;
        }

        p {
            color: #555;
        }
    </style>
          <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  
     <script>
        // Function to toggle the display of sub-menu
        function toggleSubMenu(subMenuId) {
            var subMenu = document.getElementById(subMenuId);
            subMenu.style.display = (subMenu.style.display === "none") ? "block" : "none";
        }

        // Function to close other sub-menus when opening a new one
        function closeOtherSubMenus(clickedSubMenuId) {
            var subMenus = document.getElementsByClassName("sub-menu");
            for (var i = 0; i < subMenus.length; i++) {
                var subMenu = subMenus[i];
                if (subMenu.id !== clickedSubMenuId) {
                    subMenu.style.display = "none";
                }
            }
        }

        // Function to handle main menu item clicks
        function handleMainMenuClick(clickedSubMenuId) {
            closeOtherSubMenus(clickedSubMenuId);
        }

        // Function to handle sub-menu clicks
        function handleSubMenuClick(subMenuId) {
            toggleSubMenu(subMenuId);
        }
        
        
  
        function ajaxcall() {

            console.log("HELO");

            $.ajax({
                url: "toprofile",
                type: "GET",
                success: function(response) {
                    var myObject = response.myObjectSession;

                    $("#content").html(response);
                },
              
                error: function(xhr, status, error) {
                    // Handle the error if the request fails
                }
            });
        }

    
    </script>
</head>
<body>


    <div id="sidebar">
        <h2 style="margin-bottom: 20px; color: #fff;">Menu</h2>
        <a href="javascript:void(0);"  id="profile" onclick="ajaxcall()">Profile</a>
        <a href="javascript:void(0);" onclick="toggleSubMenu('masterDataSubMenu')">Master Data</a>
        <div id="masterDataSubMenu" class="sub-menu">
            <a href="javascript:void(0);" onclick="toggleSubMenu('holidaysSubMenu')">Holidays</a>
            <div id="holidaysSubMenu" class="sub-menu">
                <a href="#usedHol">Used Holidays</a>
                <a href="#leftHol">Remaining Holidays</a>
            </div>
            <a href="javascript:void(0);" onclick="toggleSubMenu('leavesSubMenu')">Leaves</a>
            <div id="leavesSubMenu" class="sub-menu">
                <a href="#perleave">Permitted Leaves</a>
                <a href="#leftleave">Remaining Leaves</a>
            </div>
        </div>
        <a href="javascript:void(0);" onclick="toggleSubMenu('almsSubMenu')">ALMS</a>
        <div id="almsSubMenu" class="sub-menu">
            <a href="#Leaves">Leaves</a>
            <a href="#Permissions">Permissions</a>
            <a href="#Attendance">Attendance</a>
            <a href="#Approvals">Approvals</a>
        </div>
      <a href="javascript:void(0);" onclick="toggleSubMenu('ReferDoc')">Reference Documents</a>
        <div id="ReferDoc" class="sub-menu">
           <a href="#JoiningLetter">JoiningLetter</a>
            <a href="#Graduate">Graduate</a>
        </div>
        <a href="#PaySlips">Pay Slips</a>
    </div>
    <div id="content">
        <h1>Welcome to the Dashboard</h1>
        <p>Select an option from the menu to view the corresponding page.</p>
    </div>
</body>
</html>
