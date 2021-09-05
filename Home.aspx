<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--- Carousel -->

            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="Images/ban01.jpg" alt="...">
                        <div class="carousel-caption">
                            <h3>Best Deal</h3>
                            <p>Grab it now</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="Images/ban02.jpg" alt="...">
                        <div class="carousel-caption">
                            <h3>Art Galarys</h3>
                            <p>View Stunning Art Works</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="Images/ban03.jpg" alt="...">
                        <div class="carousel-caption">
                            <h3>Fantastic paintings</h3>
                            <p>See something new</p>
                        </div>
                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <!--- Carousel -->
            <h2>Product Catogeries</h2>
            <hr />
            <asp:Repeater ID="rptrCatogery" runat="server">
                <ItemTemplate>
                    <div class="col-sm-3 col-md-3">
                        <a style="text-decoration:none;" href="SignIn.aspx">
                            <div class="thumbnail">
                                <img src="../Images/Categories/<%# Eval("imgfile")%>" alt="<%# Eval("name") %>" height="480px">
                                <div class="caption">
                                    <div class="probrand"><%# Eval("name") %></div>
                                </div>
                            </div>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
</asp:Content>

