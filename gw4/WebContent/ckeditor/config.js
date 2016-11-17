/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
/*    config.toolbar =[

                     ['Source','-','Cut','Copy','Paste','PasteText','PasteFromWord','Undo','Redo','SelectAll','RemoveFormat'],

                     '/',

                     ['Bold','Italic','Underline','Strike', 'Subscript','Superscript'],

                     ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],

                     ['NumberedList','BulletedList','Outdent','Indent','Blockquote','CreateDiv'],

                     ['Image','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],

                     ['Styles','Format','Font','FontSize','TextColor','BGColor','Maximize', 'ShowBlocks']

                 ];*/
    
    config.removeButtons = 'Underline,Subscript,Superscript';
    config.filebrowserBrowseUrl = '/gw4/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '/gw4/ckfinder/ckfinder.html?type=Images';
    config.filebrowserFlashBrowseUrl = '/gw4/ckfinder/ckfinder.html?type=Flash';
    config.filebrowserUploadUrl = '/gw4/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files';
    config.filebrowserImageUploadUrl = '/gw4/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images';
    config.filebrowserFlashUploadUrl = '/gw4/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash';

};
