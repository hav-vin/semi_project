<%@page contentType="text/html;charset=utf-8" import="java.util.*, semi2.funding.mvc.domain.Board"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> Board </title>
	<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" href="../css/font.css">
    <style>
    div{font-family: 'S-CoreDream-3Light', sans-sesrif;}
		.wp-caption, .wp-caption-text, .sticky, .gallery-caption, .bypostauthor {
    opacity: 1;
}
.clearfix:before, .clearfix:after {
    content: " ";
    display: table;
}
.clearfix:after {
    clear: both;
}
.clearfix {
    *zoom: 1;
}
.clear:after {
    clear: both;
    content: "";
    display: block;
}
::selection {
    background: #5bc0de;
    color: #fff;
}
::-moz-selection {
    background: #5bc0de;
    color: #fff;
}
.alignleft {
    float: left;
    margin: 0 20px 20px 0;
}
.alignright {
    float: right;
    margin: 0 0 20px 20px;
}
.aligncenter {
    display: block;
    margin: 10px auto;
}
.header_top .aligncenter {
    margin: 8px auto;
}
.text-align-right {
    text-align: right;
}
.text-align-left {
    text-align: left;
}
.text-align-center {
    text-align: center;
}
.content ul ul, .content ol ol {
    padding: 0 0 0 15px;
}
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
    background: transparent;
    border: 0;
    margin: 0;
    padding: 0;
    vertical-align: baseline;
    outline: 0;
}
article, aside, details, figcaption, figure, footer, header, hgroup, nav, section {
    display: block;
}

}
a img {
    border: 0;
}
img {
    max-width: 100%;
    height: auto;
}
h1, h2, h3, h4, h5, h6 {
    color: #303030;
}
h1 {
    font-size: 30px;
    line-height: 1.25em;
}
h2 {
    font-size: 24px;
    line-height: 1.384615384615385em;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 600;
}
h3 {
    font-size: 17px;
    line-height: 1.304347826086957em;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 600;
}
h4 {
    font-size: 19px;
    line-height: 1.375em;
    font-weight: 400;
}
h5 {
    font-size: 15px;
    line-height: 1.571428571428571em;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 600;
}
h6 {
    font-size: 13px;
    line-height: 1.538461538461538em;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 600;
}
h1 a, h2 a, h3 a, h4 a, h5 a, h6 a {
    color: #303030;
}
h1 a:hover, h2 a:hover, h3 a:hover, h4 a:hover, h5 a:hover, h6 a:hover {
    color: #5bc0de;
}
a, p a {
    color: #303030;
    text-decoration: none;
    cursor: pointer;
}
a:hover, p a:hover {
    color: #5bc0de;
    text-decoration: none;
}
input[type='submit'], .woocommerce input[type='button'], .woocommerce-page input[type='button'] {
    -webkit-appearance: none;
}
ul {
    list-style-position: inside;
}
html {
    height: 100%;
    margin: 0!important;
    -webkit-transition: all 1.3s ease-out;
    -moz-transition: all 1.3s ease-out;
    -o-transition: all 1.3s ease-out;
    -ms-transition: all 1.3s ease-out;
    transition: all 1.3s ease-out;
}
body {
    font-family: 'Raleway', sans-serif;
    font-size: 14px;
    line-height: 26px;
    color: #818181;
    font-weight: 400;
    background-color: #f6f6f6;
    overflow-y: scroll;
    overflow-x: hidden!important;
    -webkit-font-smoothing: antialiased;
}
.wrapper {
    background-color: #f6f6f6;
    position: relative;
    z-index: 1000;
    -webkit-transition: left .33s cubic-bezier(0.694, 0.0482, 0.335, 1);
    -moz-transition: left .33s cubic-bezier(0.694, 0.0482, 0.335, 1);
    -o-transition: left .33s cubic-bezier(0.694, 0.0482, 0.335, 1);
    -ms-transition: left .33s cubic-bezier(0.694, 0.0482, 0.335, 1);
    transition: left .33s cubic-bezier(0.694, 0.0482, 0.335, 1);
    left: 0;
}
.right_side_menu_opened .wrapper {
    left: -270px;
}
.right_side_menu_opened .wrapper header.fixed, .right_side_menu_opened .wrapper header.fixed_hiding, .right_side_menu_opened .wrapper header.sticky {
    left: -270px;
}
@media only screen and (min-width:1100px) {
    .right_side_menu_opened: not(.boxed) .carousel-inner:not(.relative_position) {
    left: -270px!important;
}
}.wrapper_inner {
    width: 100%;
    overflow: hidden;
}
body.boxed .wrapper_inner {
    overflow: visible;
}
body.boxed .content {
    overflow: hidden;
}
.meta {
    display: none;
}
.ajax_loader {
    position: fixed;
    top: 50%;
    left: 50%;
    z-index: 1100;
    display: none;
}
.ajax_loader_1 {
    position: relative;
    display: inline-block;
    width: 100%;
    height: 100%}
.ajax_loader_2 {
    margin: -50% 0 0 -50%}
.ajax_loader .pulse {
    width: 32px;
    height: 32px;
    margin: -16px 0 0 -16px;
    background-color: #303030;
    -webkit-border-radius: 16px;
    -moz-border-radius: 16px;
    -ms-border-radius: 16px;
    -o-border-radius: 16px;
    border-radius: 16px;
    -webkit-animation: scaleout 1.0s infinite ease-in-out;
    animation: scaleout 1.0s infinite ease-in-out;
}
.touch .title.has_fixed_background {
    background-attachment: scroll;
}
.box_image_with_border {
    display: block;
    position: relative;
    border-bottom: 5px solid #ddd;
    -webkit-transition: all .4s ease-out 0s;
    -moz-transition: all .4s ease-out 0s;
    -o-transition: all .4s ease-out 0s;
    -ms-transition: all .4s ease-out 0s;
    text-align: center;
}
.box_image_with_border:hover {
    border-color: #5bc0de;
}
.box_image_with_border h3 {
    margin: 0 0 15px;
}
.box_image_holder {
    display: block;
    position: relative;
    margin: 0 0 56px;
    text-align: left;
}
.box_image_holder a {
    position: relative;
    display: block;
}
.box_image_holder .box_image_shadow {
    display: block;
    position: absolute;
    bottom: -8px;
    left: 0;
    width: 100%;
    height: 100%;
    background-image: url('img/box_image_shadow.png');
    background-repeat: no-repeat;
    background-position: center bottom;
    background-size: 100% 30px;
    -webkit-background-size: 100% 30px;
    -moz-background-size: 100% 30px;
    -o-background-size: 100% 30px;
    -webkit-transition: all .4s ease-out 0s;
    -moz-transition: all .4s ease-out 0s;
    -o-transition: all .4s ease-out 0s;
    -ms-transition: all .4s ease-out 0s;
}
.box_image_with_border:hover .box_image_shadow {
    bottom: -13px;
    opacity: .2;
    filter: alpha(opacity=20);
}
.box_image_holder .image_holder_inner {
    position: relative;
    display: inline-block;
    width: 100%;
    top: 0;
    left: 0;
    -webkit-transition: all .4s ease-out 0s;
    -moz-transition: all .4s ease-out 0s;
    -o-transition: all .4s ease-out 0s;
    -ms-transition: all .4s ease-out 0s;
}
.box_image_with_border:hover .box_image_holder .image_holder_inner {
    top: -15px;
}
.box_image_holder img {
    width: 100%}
.box_image_holder .box_icon {
    display: inline-block;
    position: absolute;
    left: 50%;
    bottom: 0;
    -webkit-transform: translateZ(0px);
    -moz-transform: translateZ(0px);
}
.box_image_holder .box_icon .fa-stack {
    margin: 0 0 0 -50%;
    font-size: 4em;
}
.box_image_holder .box_icon .fa-stack i {
    margin: 35% 0 0;
}
.box_image_holder .box_icon .fa-stack i.fa-stack-base {
    color: #5bc0de;
}
.separator {
    position: relative;
    display: block;
    height: 1px;
    background-color: #eaeaea;
    margin: 10px 0;
}
.separator.transparent {
    background-color: transparent;
}
.separator.small {
    background-color: #303030;
    height: 2px;
    position: relative;
    width: 22px;
    display: block;
    margin: 10px auto 20px auto;
}
.wpb_column>.wpb_wrapper .separator.small {
    margin-bottom: 20px;
}
.separator.small.left {
    margin: 10px 0 20px 0;
}
.separator.small.right {
    margin: 10px 0 20px auto;
}
.q_icon_list {
    margin-bottom: 21px;
}
.q_icon_list p {
    font-size: 15px;
    line-height: 27px;
    font-weight: 400;
    margin: 0 0 10px;
    padding: 0 0 0 38px;
    position: relative;
    color: #303030;
}
.q_icon_list i {
    background-color: #5bc0de;
    color: #fff;
    font-size: 18px;
    line-height: 27px;
    height: 27px;
    width: 27px;
    text-align: center;
    border-radius: 2em;
    -webkit-border-radius: 2em;
    -moz-border-radius: 2em;
    -o-border-radius: 2em;
}
.q_icon_list i.transparent {
    background: transparent;
    border: 0;
    color: #ababab;
}
.q_progress_bar {
    position: relative;
    margin: 0 0 28px 0;
    width: 100%;
    overflow: hidden;
    text-align: left;
}
.q_progress_bar .progress_content_outer {
    background-color: #e3e3e3;
    position: relative;
    overflow: hidden;
    height: 13px;
}
.q_progress_bar .progress_content {
    position: absolute;
    top: 0;
    left: 0;
    max-width: 100%;
    overflow: hidden;
    background-color: #5bc0de;
    height: 13px;
    box-sizing: border-box;
}
.q_progress_bar .progress_title_holder {
    position: relative;
    margin: 0 0 7px 0;
}
.q_progress_bar .progress_title {
    display: inline-block;
    z-index: 100;
}
.q_progress_bar .progress_number_wrapper {
    text-align: right;
    position: absolute;
    left: 0;
    z-index: 10;
    opacity: 0;
    filter: alpha(opacity=0);
    color: #fff;
}
.q_progress_bar .progress_number {
    position: absolute;
    right: 0;
    font-size: 18px;
    font-weight: 500;
    top: -1px;
}
.q_progress_bars_vertical .progress_content_outer {
    height: 200px;
    position: relative;
    background-color: #e3e3e3;
}
.q_progress_bars_vertical .progress_number {
    font-size: 18px;
    line-height: 1em;
    color: #303030;
    display: block;
    position: relative;
    font-weight: 500;
    margin-bottom: 14px;
}
.q_progress_bars_vertical .progress_title {
    margin-bottom: .7777777777777778em;
    margin-top: 1em;
}
.q_progress_bars_vertica .progress_text {
    display: inline-block;
    line-height: 18px;
}
.q_progress_bars_vertical .progress_content_outer .progress_content {
    display: inline-block;
    width: 100%;
    position: absolute;
    bottom: 0;
    left: 0;
    background-color: #5bc0de;
    box-sizing: border-box;
}
.q_counter_holder {
    display: block;
    opacity: 0;
    filter: alpha(opacity=0);
    -webkit-transition: opacity .4s ease 0s;
    -moz-transition: opacity .4s ease 0s;
    -o-transition: opacity .4s ease 0s;
    padding: 20px 0;
}
.q_counter_holder.boxed_counter {
    border: 1px solid #eaeaea;
    padding: 20px 40px;
    background-color: #fff;
}
.q_counter_holder.left {
    text-align: left;
}
.q_counter_holder.right {
    text-align: right;
}
.q_counter_holder.center {
    text-align: center;
    padding: 20px 40px;
}
.q_counter_holder span.counter {
    font-size: 60px;
    line-height: 1em;
    font-weight: 300;
    color: #5bc0de;
    display: inline-block!important;
    height: 1em;
}
.q_counter_holder p.counter_text {
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
    margin: 12px 0 0 00;
}
.q_counter_holder .separator.small {
    background-color: #eaeaea;
    margin: 19px auto 0 auto;
}
.q_counter_holder.left .separator.small {
    margin-left: 0;
    margin-right: auto;
}
.q_counter_holder.right .separator.small {
    margin-left: auto;
    margin-right: 0;
}
.q_box_holder {
    display: block;
    position: relative;
    border: 1px solid transparent;
    z-index: 200;
}
.q_box_holder.with_icon {
    border: 2px solid #c0c0c0;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    -ms-border-radius: 4px;
    -o-border-radius: 4px;
    border-radius: 4px;
}
.box_holder_inner {
    padding: 30px 20px;
    display: block;
}
.q_box_holder.with_icon .box_holder_inner.tiny {
    padding: 37px 20px 30px;
}
.q_box_holder.with_icon .box_holder_inner.small {
    padding: 45px 20px 30px;
}
.q_box_holder.with_icon .box_holder_inner.medium {
    padding: 58px 20px 30px;
}
.q_box_holder.with_icon .box_holder_inner.large {
    padding: 71px 20px 30px;
}
.q_box_holder.with_icon .box_holder_inner.very_large {
    padding: 85px 20px 30px;
}
.box_holder_inner.left {
    text-align: left;
}
.box_holder_inner.right {
    text-align: right;
}
.box_holder_inner.center {
    text-align: center;
}
.box_holder_icon {
    position: absolute;
    display: block;
    left: 50%;
    top: 0;
    z-index: 250;
}
.box_holder_icon_inner {
    margin: -50% 0 0 -50%}
.box_holder_icon_inner.circle, .box_holder_icon_inner.square, .box_holder_icon_inner.image {
    margin: -50% 0 0 -50%}
.box_holder_icon_inner.circle .fa-stack, .circle .icon_holder .fa-stack {
    -o-border-radius: 2em;
    -moz-border-radius: 2em;
    -webkit-border-radius: 2em;
    -ms-border-radius: 2em;
    border-radius: 2em;
}
.box_holder_icon .fa-stack i {
    color: #5bc0de;
}
.box_holder_icon_inner.tiny i.fa-circle {
    font-size: 40px;
}
.box_holder_icon_inner.image.tiny img {
    height: 35px;
}
.box_holder_icon_inner.image.small img {
    height: 52px;
}
.box_holder_icon_inner.image.medium img {
    height: 78px;
}
.box_holder_icon_inner.image.large img {
    height: 104px;
}
.box_holder_icon_inner.image.very_large img {
    height: 130px;
}
.qbutton, .load_more a, .blog_load_more_button a, #submit_comment, .drop_down .wide .second ul li .qbutton, .drop_down .wide .second ul li ul li .qbutton {
    position: relative;
    display: inline-block;
    width: auto;
    height: 39px;
    line-height: 39px;
    margin: 0;
    padding: 0 23px;
    border: 2px solid #303030;
    font-size: 13px;
    font-weight: 700;
    font-family: inherit;
    text-align: left;
    color: #303030;
    text-decoration: none;
    cursor: pointer;
    white-space: nowrap;
    outline: 0;
    font-style: normal;
    text-transform: uppercase;
    letter-spacing: 1px;
    -o-border-radius: 4px;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
    -ms-border-radius: 4px;
    border-radius: 4px;
    text-shadow: none;
    background-color: transparent;
    -webkit-transition: color .1s linear, background-color .1s linear, border-color .1s linear;
    -moz-transition: color .1s linear, background-color .1s linear, border-color .1s linear;
    -ms-transition: color .1s linear, background-color .1s linear, border-color .1s linear;
    -o-transition: color .1s linear, background-color .1s linear, border-color .1s linear;
    transition: color .1s linear, background-color .1s linear, border-color .1s linear;
    -webkit-box-sizing: initial!important;
    -moz-box-sizing: initial!important;
    box-sizing: initial!important;
}
input.qbutton {
    line-height: 36px;
}
.qbutton:hover, .load_more a:hover, .blog_load_more_button a:hover, #submit_comment:hover, .drop_down .wide .second ul li .qbutton:hover, .drop_down .wide .second ul li ul li .qbutton:hover {
    background-color: #5bc0de;
    border-color: #5bc0de;
    color: #fff;
    text-decoration: none;
}
.qbutton.left {
    text-align: left;
}
.qbutton.right {
    text-align: right;
}
.qbutton.center {
    text-align: center;
}
.qbutton.big_large {
    height: 58px;
    line-height: 58px;
    font-size: 20px;
    padding: 0 22px;
}
.qbutton.big_large_full_width {
    width: 100%;
    height: 90px;
    line-height: 90px;
    font-size: 20px;
    padding: 0;
    text-align: center;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -ms-box-sizing: border-box;
    -o-box-sizing: border-box;
}
.qbutton.large {
    height: 47px;
    line-height: 47px;
    font-size: 16px;
    padding: 0 29px;
}
.qbutton.small {
    height: 30px;
    line-height: 30px;
    font-size: 12px;
    padding: 0 17px;
}
.qbutton.white {
    border-color: #fff;
    color: #fff;
}
.qbutton.white:hover {
    background-color: #5bc0de;
    border-color: #5bc0de;
}
.qbutton.green {
    border-color: #5bc0de;
    color: #fff;
    background-color: #5bc0de;
}
.qbutton.green:hover {
    background-color: #fff;
    border-color: #fff;
    color: #a2a2a2;
}
.qbutton i {
    margin: 0 0 0 10px;
}
.qbutton.large i {
    margin: 0 0 0 17px;
}
.qbutton.medium i {
    margin: 0 0 0 15px;
}
.qbutton.small i {
    margin: 0 0 0 10px;
}
.qbutton.tiny i {
    margin: 0 0 0 8px;
}
.qbutton.big_large i, .qbutton.big_large_full_width i {
    margin: 0 0 0 19px;
}
#submit_comment, .load_more.tiny a {
    height: 39px;
    line-height: 39px;
    font-size: 12px;
    padding: 0 18px;
}
#submit_comment {
    line-height: 36px;
}
.easyPieChart {
    position: relative;
}
.easyPieChart canvas {
    position: absolute;
    top: 0;
    left: 0;
}
.q_pie_chart_holder, .q_pie_chart_with_icon_holder {
    display: block;
    margin: 0 0 30px;
    opacity: 0;
    filter: alpha(opacity=0);
    -webkit-transition: opacity .3s ease 0s;
    -moz-transition: opacity .3s ease 0s;
    -o-transition: opacity .3s ease 0s;
}
.q_percentage {
    font-size: 35px;
    font-weight: 500;
    color: #303030;
    text-align: center;
    margin: 0 auto;
    opacity: 0;
    filter: alpha(opacity=0);
    -webkit-transition: opacity .3s ease 0s;
    -moz-transition: opacity .3s ease 0s;
    -o-transition: opacity .3s ease 0s;
}
.q_percentage_with_icon {
    color: #5bc0de;
    text-align: center;
    margin: 0 auto;
    opacity: 0;
    filter: alpha(opacity=0);
    -webkit-transition: opacity .3s ease 0s;
    -moz-transition: opacity .3s ease 0s;
    -o-transition: opacity .3s ease 0s;
    -webkit-backface-visibility: hidden;
}
.q_pie_chart_holder .tocounter {
    float: none;
    margin: 0;
}
.q_percentage_with_icon i {
    float: none;
    margin: 0;
    vertical-align: middle!important;
    color: #b9b9b9;
}
.q_pie_chart_holder .pie_chart_text, .q_pie_chart_with_icon_holder .pie_chart_text {
    text-align: center;
    margin: 28px 0 0;
}
.q_pie_chart_holder .pie_chart_text .pie_title, .q_pie_chart_with_icon_holder .pie_chart_text .pie_title {
    margin: 0 0 .35em;
}
.q_pie_chart_holder .separator.small {
    background-color: #eaeaea;
    margin: 10px auto 12px auto;
}
.image_with_text {
    display: inline-block;
    width: 100%;
    position: relative;
}
.image_with_text img {
    display: block;
    margin: 0 0 22px 0;
}
.call_to_action {
    position: relative;
    display: block;
    padding: 51px 21px;
    background-color: #5bc0de;
}
.call_to_action .two_columns_75_25 {
    position: relative;
}
.call_to_action .text_wrapper {
    position: relative;
}
.call_to_action .text_wrapper .call_to_action_text {
    color: #fff;
    letter-spacing: 1px;
    font-size: 22px;
    font-weight: 500;
}
.call_to_action.with_icon .text_wrapper .call_to_action_text {
    padding: 0 0 0 54px;
    line-height: 1em;
}
.call_to_action .text_wrapper .call_to_action_icon_holder {
    position: absolute;
    height: 100%}
.call_to_action .text_wrapper .call_to_action_icon {
    display: table;
    height: 100%}
.call_to_action .text_wrapper .call_to_action_icon_inner {
    display: table-cell;
    height: 100%;
    vertical-align: middle;
}
.call_to_action .text_wrapper .call_to_action_icon_inner i {
    color: #fff;
}
.call_to_action .column2.button_wrapper {
    text-align: right;
}
.call_to_action .column2.button_wrapper .qbutton {
    position: absolute;
    right: 0;
    top: 50%;
    margin: -21px 0 0 0;
}
.call_to_action .column2.button_wrapper .qbutton.small {
    margin-top: -17px;
}
.call_to_action .column2.button_wrapper .qbutton.large {
    margin-top: -25px;
}
.call_to_action .column2.button_wrapper .qbutton.big_large {
    margin-top: -31px;
}
.full_width .parallax_content {
    width: 1100px;
    margin: 0 auto;
}
section.section section.parallax {
    margin: -50px 0;
}
.boxed section.section section.parallax {
    margin: -50px -25px;
}
.boxed .full_width .parallax_content {
    width: auto;
    margin: 0;
    padding: 0 25px;
}
section.parallax_section_holder {
    position: static;
    padding: 0;
    background-repeat: no-repeat;
    background-color: transparent;
    background-position: center 0;
    background-attachment: fixed;
    overflow: hidden;
}
.parallax_content {
    z-index: 100;
    position: relative;
}
.parallax_content.left {
    text-align: left;
}
.parallax_content.center {
    text-align: center;
}
.parallax_content.right {
    text-align: right;
}
.portfolio_single {
    display: block;
    position: relative;
}
.portfolio_single_text_holder, .portfolio_detail, .lightbox_single_portfolio {
    position: relative;
}
.portfolio_single .flexslider, .portfolio_single .portfolio_single_text_holder {
    margin: 0 0 40px;
}
.portfolio_single .portfolio_images .fluid-width-video-wrapper, .portfolio_single .portfolio_images img {
    margin: 0 0 18px;
}
.portfolio_single .portfolio_container {
    position: relative;
    z-index: 200;
}
.portfolio_single h2 {
    margin: 0 0 5px 0;
}
.portfolio_single h3 {
    margin: 0 0 8px 0;
}
.portfolio_detail.portfolio_single_follow {
    position: relative;
}
.portfolio_detail .info {
    padding: 0 0 9px;
    margin: 0 0 9px;
}
.portfolio_detail .info:last-child {
    border: 0;
}
.video_holder {
    position: relative;
    width: 100%;
    display: block;
    min-height: 1px;
}
.portfolio_single .video .mobile-video-image {
    background-position: center center;
    background-repeat: no-repeat;
    background-size: cover;
    display: none;
    height: 100%;
    left: 0;
    position: absolute;
    top: 0;
    width: 100%;
    z-index: 10;
}
.portfolio_single .video {
    margin: 0 0 44px;
    position: relative;
}
.portfolio_single .video .video-wrap {
    overflow: hidden;
    position: relative;
    width: 100%;
    z-index: 10;
}
.portfolio_single .video .video-wrap .mejs-poster {
    background-size: cover!important;
    -moz-background-size: cover!important;
    -webkit-background-size: cover!important;
    -o-background-size: cover!important;
    width: 100%!important;
    height: 100%!important;
}
.portfolio_single .video .video-wrap .mejs-container {
    background-color: transparent!important;
    background-image: none!important;
    height: 100%!important;
    width: 100%!important;
    overflow: hidden;
}
.portfolio_single .video .video-wrap .mejs-mediaelement {
    background: none!important;
    border: 0!important;
}
.portfolio_single .video .video-wrap .mejs-container .mejs-poster img {
    max-width: none!important;
    width: 100%!important;
}
.portfolio_single .mejs-container .mejs-controls {
    visibility: visible!important;
}
.portfolio_single .mejs-controls .mejs-volume-button .mejs-volume-slider {
    display: none!important;
}
.flexslider .slides .mejs-poster img, .portfolio_slider .portfolio_slides .mejs-poster img {
    display: none;
}
.portfolio_single .flexslider .video .video-wrap {
    margin: 0;
}
.portfolio_navigation {
    display: inline-block;
    width: 100%;
    text-align: center;
    padding: 28px 0 50px;
    z-index: 100;
    position: relative;
}
.portfolio_navigation .portfolio_prev, .portfolio_navigation .portfolio_next, .portfolio_navigation .portfolio_button {
    display: inline-block;
    height: 35px;
    line-height: 35px;
}
.portfolio_navigation .portfolio_prev {
    position: absolute;
    left: 0;
}
.portfolio_navigation .portfolio_next {
    position: absolute;
    right: 0;
}
.portfolio_navigation .portfolio_prev a, .portfolio_navigation .portfolio_next a {
    position: relative;
    display: inline-block;
    width: 38px;
    height: 38px;
    line-height: 38px;
    margin: 0 11px 0 0;
    text-align: center;
    font-size: 18px;
    color: #b4b4b4;
    text-decoration: none;
    text-transform: uppercase;
    cursor: pointer;
    white-space: nowrap;
    border: 2px solid #e5e5e5;
    outline: 0;
    -o-border-radius: 4px;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
    -ms-border-radius: 4px;
    border-radius: 4px;
    text-shadow: none;
    -webkit-transition: all .3s ease-in-out;
    -moz-transition: all .3s ease-in-out;
    -ms-transition: all .3s ease-in-out;
    -o-transition: all .3s ease-in-out;
    transition: all .3s ease-in-out;
}
.portfolio_navigation .portfolio_prev a:hover, .portfolio_navigation .portfolio_next a:hover {
    color: #303030;
    background-color: #e3e3e3;
    border-color: #e3e3e3;
}
.portfolio_navigation .portfolio_button a {
    background-image: url('img/portfolio_list_button.png');
    background-position: 0 0;
    background-repeat: no-repeat;
    width: 19px;
    display: block;
    height: 19px;
    margin: 11px 0 0 0;
    -webkit-transition: background-image .3s ease-in-out;
    -moz-transition: background-image .3s ease-in-out;
    -ms-transition: background-image .3s ease-in-out;
    -o-transition: background-image .3s ease-in-out;
    transition: background-image .3s ease-in-out;
}
.portfolio_navigation .portfolio_button a:hover {
    background-image: url('img/portfolio_list_button_hover.png');
}
@media only screen and (-webkit-min-device-pixel-ratio:1.5), only screen and (min--moz-device-pixel-ratio:1.5), only screen and (-o-min-device-pixel-ratio:150/100), only screen and (min-device-pixel-ratio:1.5), only screen and (min-resolution:160dpi) {
    .portfolio_navigation .portfolio_button a {
    background-image: url('img/portfolio_list_button@1_5x.png');
    -o-background-size: 19px 19px;
    -webkit-background-size: 19px 19px;
    -moz-background-size: 19px 19px;
    background-size: 19px 19px;
}
.portfolio_navigation .portfolio_button a:hover {
    background-image: url('img/portfolio_list_button_hover@1_5x.png');
}
}@media only screen and (-webkit-min-device-pixel-ratio:2.0), only screen and (min--moz-device-pixel-ratio:2.0), only screen and (-o-min-device-pixel-ratio:200/100), only screen and (min-device-pixel-ratio:2.0), only screen and (min-resolution:210dpi) {
    .portfolio_navigation .portfolio_button a {
    background-image: url('img/portfolio_list_button@2x.png');
    -o-background-size: 19px 19px;
    -webkit-background-size: 19px 19px;
    -moz-background-size: 19px 19px;
    background-size: 19px 19px;
}
.portfolio_navigation .portfolio_button a:hover {
    background-image: url('img/portfolio_list_button_hover@2x.png');
}
}.portfolio_navigation .portfolio_prev a:hover, .portfolio_navigation .portfolio_next a:hover {
    background-image: url('img/button-bg-px.png')!important;
}
.portfolio_social_holder {
    width: 100%;
    display: inline-block;
}
.portfolio_single .portfolio_social_holder .portfolio_share, .portfolio_single .portfolio_social_holder .portfolio_like {
    display: inline-block;
    margin: 0;
}
.portfolio_gallery {
    display: inline-block;
    width: 100%;
    position: relative;
    margin: 0 0 15px 0;
}
.portfolio_single .portfolio_gallery {
    margin: 0 0 3px 0;
}
.portfolio_gallery a {
    position: relative;
    float: left;
    display: inline-block;
    overflow: hidden;
    -webkit-backface-visibility: hidden;
    -webkit-transform: translateZ(0px);
    -moz-transform: translateZ(0px);
}
.portfolio_gallery a.v2 {
    width: 49%;
    margin: 0 2% 2% 0;
}
.portfolio_gallery a.v3 {
    width: 32%;
    margin: 0 2% 2% 0;
}
.portfolio_gallery a.v4 {
    width: 23.5%;
    margin: 0 2% 2% 0;
}
.portfolio_gallery a.v2:nth-child(2n), .portfolio_gallery a.v3:nth-child(3n), .portfolio_gallery a.v4:nth-child(4n) {
    margin: 0 0 2% 0;
}
.portfolio_gallery a img, .portfolio_gallery a frame {
    position: relative;
    display: block;
    width: 100%;
    z-index: 100;
}
.portfolio_gallery iframe {
    min-height: 200px;
}
.portfolio_gallery a .gallery_text_holder {
    background-color: #000;
    background-color: rgba(0, 0, 0, 0.50);
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: inline-block;
    z-index: 200;
    opacity: 0;
    filter: alpha(opacity=0);
    visibility: visible;
    -webkit-transition: opacity .4s;
    -moz-transition: opacity .4s;
    -o-transition: opacity .4s;
    -ms-transition: opacity .4s;
}
.portfolio_gallery a img {
    -webkit-transition: all .3s ease-out;
    -moz-transition: all .3s ease-out;
    -o-transition: all .3s ease-out;
    transition: all .3s ease-out;
}
.portfolio_gallery a:hover .gallery_text_holder {
    opacity: 1;
    filter: alpha(opacity=100);
}
.portfolio_gallery a .gallery_text_inner {
    display: table;
    text-align: center;
    vertical-align: middle;
    width: 100%;
    height: 100%}
.portfolio_gallery a .gallery_text_inner h6 {
    display: table-cell;
    text-align: center;
    vertical-align: middle;
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0 15px;
    color: #fff;
}
.projects_holder_outer {
    margin: 0;
    display: block;
    width: 100%}
.projects_holder_outer .container .container_inner {
    padding: 0;
}
.full_width .projects_holder_outer.v6 .hover_text, .full_width .projects_holder_outer.v5 .hover_text, .full_width .projects_holder_outer.v4 .hover_text, .full_width .projects_holder_outer.v5 .standard, .full_width .projects_holder_outer.v6 .standard, .full_width .projects_holder_outer.v4 .standard {
    width: 95%;
    margin: 0 auto;
}
.full_width .section_inner .projects_holder_outer.v6 .hover_text, .full_width .section_inner .projects_holder_outer.v5 .hover_text, .full_width .section_inner .projects_holder_outer.v4 .hover_text, .full_width .section_inner .projects_holder_outer.v5 .standard, .full_width .section_inner .projects_holder_outer.v6 .standard, .full_width .section_inner .projects_holder_outer.v4 .standard {
    width: 100%}
.full_width .projects_holder_outer.v6 .hover_text.no_space, .full_width .projects_holder_outer.v5 .hover_text.no_space, .full_width .projects_holder_outer.v4 .hover_text.no_space {
    width: 100%;
    margin: 0;
}
.projects_holder {
    font-size: .1px;
    line-height: 0;
    list-style-type: none;
    text-align: justify;
}
.projects_holder:after, .projects_holder:before {
    content: "";
    display: inline-block!important;
    width: 100%}
.projects_holder>.mix {
    display: none;
    position: relative;
    vertical-align: top;
    -webkit-transition: all .7s ease-out;
    -moz-transition: all .7s ease-out;
    -o-transition: all .7s ease-out;
    transition: all .7s ease-out;
    text-align: left;
}
.projects_holder .mix .image {
    position: relative;
    display: block;
    overflow: hidden;
    width: 100%;
    -moz-transform: translateZ(0px);
    -webkit-transform: translateZ(0px);
}
.projects_holder article .image img {
    position: relative;
    display: block;
    width: 100%;
    z-index: 100;
}
.projects_holder article .image img, .portfolio_slider .portfolio_slides li.item img {
    -webkit-transform: scale(1);
    -moz-transform: scale(1);
    -ms-transform: scale(1);
    -o-transform: scale(1);
    transform: scale(1);
    -webkit-transition: -webkit-transform .3s ease-in-out;
    -moz-transition: -moz-transform .3s ease-in-out;
    -ms-transition: -ms-transform .3s ease-in-out;
    -o-transition: -o-transform .3s ease-in-out;
    transition: transform .3s ease-in-out;
}
.projects_holder.hover_text.no_space article .image img {
    margin: 0 1px;
}
.projects_holder article .image_holder:hover .image img, .portfolio_slider .portfolio_slides li.item:hover img {
    -webkit-transform: scale(1.1);
    -moz-transform: scale(1.1);
    -ms-transform: scale(1.1);
    -o-transform: scale(1.1);
    transform: scale(1.1);
}
.projects_holder article .image_holder, .projects_holder article .portfolio_description {
    display: block;
    position: relative;
}
.projects_holder article .portfolio_description {
    padding: 20px 0 22px;
    text-align: center;
    background-color: #fff;
    border-style: none;
    border-top: none!important;
    border-width: 1px;
    border-color: #fefefe;
}
.projects_holder article .portfolio_description.text_align_left {
    text-align: left;
}
.projects_holder article .portfolio_description.text_align_center {
    text-align: center;
}
.projects_holder article .portfolio_description.text_align_right {
    text-align: right;
}
.standard_no_space.projects_holder article .portfolio_description {
    margin: 0 -1px 0 0;
}
.projects_holder article .portfolio_description .portfolio_title {
    display: block;
    margin: 0 0 7px 0;
}
.portfolio_slider .image_holder .separator.small {
    margin: 10px auto;
    background-color: #fff;
}
.projects_holder article .hover_feature_holder_title .separator.small, .projects_masonry_holder article .hover_feature_holder_title .separator.small {
    background-color: #fff;
    margin-top: 10px;
    margin-bottom: 10px;
}
.projects_holder article .portfolio_description .separator.small {
    margin-top: 10px;
    margin-bottom: 10px;
}
.wpb_column>.wpb_wrapper .portfolio_slider .image_holder .separator.small {
    background-color: #fff;
}
.portfolio_slider .image_holder .separator.small.transparent {
    background-color: transparent!important;
}
.projects_holder.hover_text article .hover_feature_holder_title .separator {
    background-color: #fff;
}
.projects_holder.hover_text article .hover_feature_holder_title .portfolio_title a, .projects_holder.hover_text article span.text_holder span.text_inner .hover_feature_holder_title .project_category {
    color: #fff;
}
.projects_holder.hover_text article span.text_holder span.text_inner .hover_feature_holder_title .project_category {
    font-weight: 500;
}
.projects_holder.hover_text article .hover_feature_holder_title .portfolio_title {
    margin: 0 0 7px;
}
.projects_holder article .portfolio_description .project_category, .projects_holder.hover_text article .project_category {
    line-height: 22px;
    display: block;
    font-size: 13px;
    font-weight: 500;
}
.portfolio_single .portfolio_like {
    position: relative;
    display: inline-block;
    cursor: pointer;
    padding: 0;
}
.portfolio_single .dots {
    padding: 0 7px 0 4px;
}
.portfolio_single .dots i {
    font-size: 3px;
    vertical-align: middle;
}
.portfolio_single .portfolio_like a {
    display: block;
    font-size: 13px;
    line-height: 13px;
    text-align: center;
}
.portfolio_single .portfolio_like span {
    line-height: 19px;
}
.portfolio_slider .portfolio_like a:hover i, .portfolio_slider .portfolio_like span {
    color: #e0e0e0;
}
.projects_holder article .portfolio_like a, .projects_holder article .portfolio_like:hover a {
    color: #fff;
}
.projects_holder article span.text_holder {
    background-color: #000;
    background-color: rgba(21, 21, 21, 0.78);
    bottom: 0;
    display: inline-block;
    height: 100%;
    left: 0;
    opacity: 0;
    position: absolute;
    transition: opacity .4s ease-in-out;
    -webkit-transition: opacity .4s ease-in-out;
    -moz-transition: opacity .4s ease-in-out;
    -o-transition: opacity .4s ease-in-out;
    -ms-transition: opacity .4s ease-in-out;
    visibility: visible;
    overflow: hidden;
    width: 100%;
    z-index: 200;
}
.touch .projects_holder article span.text_holder {
    display: none!important;
    height: 0!important;
    width: 0!important;
    opacity: 0!important;
    visibility: hidden!important;
}
.projects_holder article:hover span.text_holder {
    height: 100%!important;
}
.projects_holder article .image_holder:hover span.text_holder {
    opacity: 1;
    filter: alpha(opacity=100);
}
.projects_holder.hover_text.with_mask article .image_holder:hover .image_hover {
    opacity: 0;
    filter: alpha(opacity=0);
}
.projects_holder article span.text_holder span.text_outer {
    display: table;
    text-align: center;
    vertical-align: middle;
    width: 100%;
    height: 100%;
    overflow: hidden;
}
.projects_holder article span.text_holder span span.text_inner {
    display: table-cell;
    text-align: center;
    vertical-align: middle;
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
}
.projects_holder article span.text_holder span span.text_inner .project_category {
    color: #a6a6a6;
    display: block;
    font-size: 13px;
    line-height: 22px;
}
.projects_holder article .feature_holder, .projects_holder article .feature_holder .feature_holder_icons {
    display: inline-block;
}
.projects_holder.hover_text article .feature_holder {
    width: 100%}
.projects_holder.hover_text article .feature_holder .feature_holder_icons {
    margin: 20px 0 0 0;
}
.portfolio_slider, .portfolio_slides .image_holder {
    position: relative;
    display: block;
    -webkit-backface-visibility: hidden;
}
.portfolio_slides .image_pixel_hover {
    position: absolute;
    height: 100%;
    width: 100%;
    display: block;
    background-color: transparent;
    -webkit-transition: all .3s ease-in-out;
    -moz-transition: all .3s ease-in-out;
    -ms-transition: all .3s ease-in-out;
    -o-transition: all .3s ease-in-out;
    transition: all .3s ease-in-out;
    z-index: 100;
}
.touch .portfolio_slides .image_pixel_hover {
    display: none!important;
}
.portfolio_slides li:hover .image_pixel_hover {
    background-color: #000;
    background-color: rgba(21, 21, 21, 0.78);
}
.portfolio_slides .image_holder .image {
    position: relative;
    display: block;
    overflow: hidden;
    width: 100%;
    -webkit-transition: -webkit-transform .4s;
    -moz-transition: -moz-transform .4s;
    transition: transform .4s;
    -webkit-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
}
.portfolio_slides .hover_feature_holder {
    position: absolute;
    display: block;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 101;
}
.touch .portfolio_slides .hover_feature_holder {
    display: none!important;
}
.portfolio_slides .hover_feature_holder_icons {
    position: relative;
    opacity: 0;
    text-align: center;
    display: inline-block;
    width: 100%;
    margin: 0 0 30px;
    -webkit-transition: opacity .4s ease-in-out .1s;
    -moz-transition: opacity .4s ease-in-out .1s;
    -o-transition: opacity .4s ease-in-out .1s;
    -ms-transition: opacity .4s ease-in-out .1s;
    transition: opacity .4s ease-in-out .1s;
    -webkit-transform: translateZ(0px);
    -moz-transform: translateZ(0px);
    display: none;
}
.portfolio_slides li:hover .hover_feature_holder_icons {
    opacity: 1;
}
.portfolio_slides .hover_feature_holder_icons_inner {
    display: inline-block;
    position: relative;
}
.portfolio_slides .hover_feature_holder_outer {
    position: relative;
    opacity: 1!important;
    top: 0;
    height: 100%;
    display: table;
    width: 100%}
.portfolio_slides .hover_feature_holder_inner {
    height: 100%;
    width: 100%;
    top: 0;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -ms-box-sizing: border-box;
    -o-box-sizing: border-box;
    box-sizing: border-box;
    opacity: 0;
    display: table-cell;
    vertical-align: middle;
    padding: 0 5%;
    text-align: center;
    color: #fff;
    -webkit-transition: all .3s ease-in-out;
    -moz-transition: all .3s ease-in-out;
    -ms-transition: all .3s ease-in-out;
    -o-transition: all .3s ease-in-out;
    transition: all .3s ease-in-out;
    -webkit-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
}
.portfolio_slides .hover_feature_holder_inner .portfolio_title {
    text-transform: uppercase;
    letter-spacing: 1px;
}
.portfolio_slides .hover_feature_holder_inner .portfolio_title a {
    color: #fff;
}
.portfolio_slides .hover_feature_holder_inner .qbutton {
    margin-top: 24px;
    margin-left: 5px;
    margin-right: 5px;
}
.portfolio_slides .hover_feature_holder_inner .qbutton:hover {
    border-color: #5bc0de;
}
.portfolio_slides li:hover .hover_feature_holder_inner {
    opacity: 1;
}
.projects_holder.hover_text article .image_holder {
    overflow: hidden;
}
.projects_holder.hover_text.no_space article .image_holder {
    margin: 0 -1px;
}
.projects_holder article a.lightbox, .projects_holder article a.preview, .projects_holder article .portfolio_like, .portfolio_slider a.lightbox, .portfolio_slider a.preview, .portfolio_slider .portfolio_like {
    position: relative;
    display: inline-block;
    margin: 0 0 5px 0;
    -webkit-backface-visibility: hidden;
}
.projects_holder article a.lightbox, .portfolio_slider a.lightbox {
    margin: 0 10px 0 0;
}
.projects_holder article .portfolio_like, .portfolio_slider .portfolio_like {
    margin: 0 0 0 10px;
}
.projects_holder article .portfolio_like i, .portfolio_slider .portfolio_like i {
    line-height: 20px;
    margin: 4px 0 0 0;
}
.portfolio_like .qode-like-count span {
    display: none;
}
.projects_holder article .portfolio_like .qode-like-count, .portfolio_slider article .portfolio_like .qode-like-count {
    font-size: 13px;
    line-height: 13px;
    color: #fff;
}
.projects_holder .filler {
    display: inline-block;
    height: 0;
}
.projects_holder.v6 .mix, .projects_holder.v6.hover_text .mix {
    width: 15.7%;
    margin: 0 0 1.2%}
.projects_holder.v6.hover_text .mix {
    margin: 0 0 1.7%}
.projects_holder.v6 .filler, .projects_holder.v6.hover_text .filler {
    width: 15.7%}
.projects_holder.v6.standard_no_space .mix, .projects_holder.v6.hover_text.no_space .mix {
    width: 16.66%;
    margin: 0;
}
.projects_holder.v6.standard_no_space .mix {
    margin: 0;
}
.projects_holder.v6.standard_no_space .filler, .projects_holder.v6.hover_text.no_space .filler {
    width: 16.66%}
.safari_browser .projects_holder.v6.standard_no_space .mix, .safari_browser .projects_holder.v6.hover_text.no_space .mix {
    width: 16.6%}
.safari_browser .projects_holder.v6.standard_no_space .filler, .safari_browser .projects_holder.v6.hover_text.no_space .filler {
    width: 16.6%}
.projects_holder.v5 .mix, .projects_holder.v5.hover_text .mix {
    width: 18%;
    margin: 0 0 2.9%}
.projects_holder.v5.hover_text .mix {
    margin: 0 0 2%}
.projects_holder.v5 .filler, .projects_holder.v5.hover_text .filler {
    width: 18.5%}
.projects_holder.v5.standard_no_space .mix, .projects_holder.v5.hover_text.no_space .mix {
    width: 19.99%;
    margin: 0;
}
.projects_holder.v5.standard_no_space .mix {
    margin: 0;
}
.projects_holder.v5.standard_no_space .filler, .projects_holder.v5.hover_text.no_space .filler {
    width: 19.99%}
.safari_browser .projects_holder.v5.standard_no_space .mix, .safari_browser .projects_holder.v5.hover_text.no_space .mix {
    width: 19.93%}
.safari_browser .projects_holder.v5.standard_no_space .filler, .safari_browser .projects_holder.v5.hover_text.no_space .filler {
    width: 19.93%}
.projects_holder.v4 .mix, .projects_holder.v4.hover_text .mix {
    width: 23.5%;
    margin: 0 0 2.5%}
.projects_holder.v4.hover_text .mix {
    margin: 0 0 2.2%}
.projects_holder.v4 .filler, .projects_holder.v4.hover_text .filler {
    width: 23.5%}
.projects_holder.v4.standard_no_space .mix, .projects_holder.v4.hover_text.no_space .mix {
    width: 24.99%;
    margin: 0;
}
.projects_holder.v4.standard_no_space .mix {
    margin: 0;
}
.projects_holder.v4.standard_no_space .filler, .projects_holder.v4.hover_text.no_space .filler {
    width: 24.99%}
.projects_holder.v3 .mix, .projects_holder.v3.hover_text .mix {
    width: 32%;
    margin: 0 0 2.4%}
.projects_holder.v3.hover_text .mix {
    margin: 0 0 2.2%}
.projects_holder.v3 .filler, .projects_holder.v3.hover_text .filler {
    width: 32%}
.projects_holder.v3.standard_no_space .mix, .projects_holder.v3.hover_text.no_space .mix {
    width: 33.32%;
    margin: 0;
}
.projects_holder.v3.standard_no_space .mix {
    margin: 0;
}
.projects_holder.v3.standard_no_space .filler, .projects_holder.v3.hover_text.no_space .filler {
    width: 33.32%}
.safari_browser .projects_holder.v3.standard_no_space .mix, .safari_browser .projects_holder.v3.hover_text.no_space .mix {
    width: 33.3%}
.safari_browser .projects_holder.v3.standard_no_space .filler, .safari_browser .projects_holder.v3.hover_text.no_space .filler {
    width: 33.3%}
.projects_holder.v2 .mix, .projects_holder.v2.hover_text .mix {
    width: 49%;
    margin: 0 0 2.4%}
.projects_holder.v2.hover_text .mix {
    margin: 0 0 2.1%}
.projects_holder.v2 .filler, .projects_holder.v2.hover_text .filler {
    width: 49%}
.projects_holder.v2.standard_no_space .mix, .projects_holder.v2.hover_text.no_space .mix {
    width: 49.99%;
    margin: 0;
}
.projects_holder.v2.standard_no_space .mix {
    margin: 0;
}
.projects_holder.v2.standard_no_space .filler, .projects_holder.v2.hover_text.no_space .filler {
    width: 49.99%}
.portfolio_paging, .portfolio_paging_loading {
    text-align: center;
    margin: 40px 0 0;
}
.portfolio_paging_loading {
    display: none;
}
.portfolio_with_space .portfolio_paging, .portfolio_with_space .portfolio_paging_loading {
    margin: 15px 0 0;
}
    
    
		a{  /* 링크 부분에 밑줄 부분 제거*/
        text-decoration: none !important;
    }
    /* common header*/    
    .header_menu{
        padding: 20px  40px;
        position: fixed;
        top:0;
        width: 100%;
        z-index:2;
        background-color: white;
        border-bottom: solid 2px rgb(209, 209, 209);
    }

    .header_menu :after{
        display: block;
        clear: both;
    }

    .header_icon{
        margin-top: 5px;
        float: left;
        text-align: center;
        margin-left: 20px;
        width:auto;
    }
    .header_icon a img{
    	max-width:100%;
    	height: 65px;
    }
    #nav{
        float: right;
        width: auto;
        list-style: none;
    }

    #nav ul{
        margin: 0;
        padding: 0;
        list-style: none;
    }

    #nav ul :after{
        display: block;
        clear: both;
    }
    #nav button{
        margin-top: 10px;
        display: block;
        padding: 10px;
        color: rgb(255, 255, 255);
        font-size: 14px;
        text-decoration: none;
    }

        
        
	</style>
		
</head>

	<body>
		<center>
		<div>
			<div class="header_menu">
        <div class="header_icon">
            <a href="index.do"><img src="../img/crowd.png"></a>       
        </div>
        
        <ul id="nav" style="margin-left:10px">
        	<c:if test="${ empty loginUser}">
          	  <button class="btn btn-info clsbtn" onclick="location.href='funding/funding.do?m=form'">로그인/회원가입</button>
        	</c:if>
        	<c:if test="${ !empty loginUser}">
            	<button class="btn btn-warning clsbtn" onclick="location.href='funding/funding.do?m=out'">로그아웃</button>
        	</c:if>
        </ul> 
        
        <ul id="nav">
       		<c:if test="${ !empty loginUser}" >
          	  <button class="btn btn-info clsbtn" onclick="location.href='funding/funding.do?m=write&uid=${u_id}'">프로젝트 등록</button>
        	</c:if>
        </ul>
    </div>


    <!-- 배너 이미지 슬라이드(bootstrap) -->
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin-top:110px">
    <!-- 지시자 -->
	  <ol class="carousel-indicators">
	    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
	    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
	  </ol>

        <div id="banner" class="carousel-inner" role="listbox">

                <div class="item active">
                    <img src="../img/mainfirst.jpg" style="height:300px">
                </div>

                <div class="item">
                    <img src="../img/mainseconds.jpg" style="height:300px">
                </div>
                
                 <div class="item">
                    <img src="../img/mainthird.jpg" style="height:300px">
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
            
		</center>
		
	</div>	
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
        
    <div>    
     <div class="latest-products" style="margin-top:30px">
      <div class="container20">
        <div class="row20">
          <div class="col-md-120">
            <div class="section-heading20" style="margin-left:210px; float:left" >
              <h2><span style="background-color:#5bc0de; color:WHITE">Funding Project</span></h2>
             
              <a href="../index.do">view all products<i class="fa fa-angle-right"></i></a>
            </div>
             <div id = "table_search" style="margin-right:50px;float:right">
		              <form action = "funding/funding.do?m=search" method="get">
		              	products<i class="fa fa-angle-right"></i>
		              	<input type="text" name="search" class="input_box">
		              	<input type="submit" value="search" class="btn btn-link">
		              </form>	              	
	         </div>
          </div>

	<div class="container" style="margin-top:50px">
				<div class="container_inner default_template_holder clearfix page_container_inner" >
				<div class="vc_row wpb_row section vc_row-fluid" style=" padding-top:0px; text-align:left;"><div class=" full_section_inner clearfix">
		<div class="vc_col-sm-12 wpb_column vc_column_container">
			<div class="wpb_wrapper">
				<div class="projects_holder_outer v3 portfolio_with_space portfolio_standard "><div class="filter_outer"><div class="filter_holder">
	                            </div></div><div class="projects_holder clearfix v3 standard">
<%
	ArrayList<Board> lists = (ArrayList<Board>)request.getAttribute("lists");
    if(lists != null && lists.size() != 0){
    	 for(Board board :lists){
%>
	
	<article class="mix portfolio_category_17 portfolio_category_5  mix_all" style="display: inline-block; opacity: 1;">
	    <div class="image_holder">
	        <a class="portfolio_link_for_touch" href="#" target="_self">
	        <span class="image"><img src="../img/<%=board.getPiname()%>" width="1100" height="825" class="attachment-full wp-post-image" alt="qode interactive strata"></span></a>
	        <span class="text_holder"><span class="text_outer"><span class="text_inner"><span class="feature_holder"><span class="feature_holder_icons">
	            <a class="preview qbutton small white" href="funding.do?m=fund_content&pnum=<%=board.getPnum()%>" target="_self">view</a>
	            </span></span></span></span></span></div>
	            <div class="portfolio_description ">
	    <h5 class="portfolio_title">
	        <a href="funding/funding.do?m=fund_content&pnum=<%=board.getPnum()%>" target="_self"><%=board.getPsubject()%></a></h5>
	    <span class="project_category"><%=board.getPcontent()%></span>
	    </div>
	</article>
<%     
    	}
    }
    else{
    	System.out.println("6");
    }
%>
	<div class="filler"></div>
	<div class="filler"></div>
	<div class="filler"></div>
	</div>
			</div> 
		</div> 
	</div>
</div>
	</div>
		</div>
            </div>
      </div>
    </div>
    
         <br/><br/><br/><br/> 
         </div>
	<center>
		<footer>
	      <div class="container">
	        <div class="row">
	          <div class="col-md-12">
	            <div class="inner-content">
	              <p>Copyright &copy; 젊피중피 Co., Ltd.</a></p>
	              <br/>
	            </div>
	          </div>
	        </div>
	      </div>
	    </footer>
	</center>
	
	   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   		<script src="../bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>