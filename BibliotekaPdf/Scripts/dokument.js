

$(function () {
    ajaxCalls();
    $('.ajaxSpace').ajaxStop(ajaxCalls);
});

function ajaxCalls() {

    $("#accordion").accordion({ header: "h3", collapsible: true, autoHeight: false });
    //$("#accordion").accordion("resize");

    $(".ajaxCreate").button().click(function () {
        $('.ajaxSpace').load('/Document/Create'); 
    });

    $(".ajaxListAll").button().click(function () {
        $('.ajaxSpace').load('/Document/ListAll');
    });

    $(".ajaxCreateSubmit").button().click(function () {
        $.post("/Document/Create", $("#createForm").serialize(), function (data) { $('.ajaxSpace').html(data); });

        return false;
    });

    $(".ajaxEditSubmit").button().click(function () {
        $.post($('.ui-accordion-content-active .editForm').attr('action'), $(".ui-accordion-content-active .editForm").serialize(), function (data) { $('.ui-accordion-content-active').html(data); });
        return false;
    });


    $(".ajaxDeleteSubmit").button().click(function () {
        $.post($('.ui-accordion-content-active .deleteForm').attr('action'), function (data) { $('.ajaxSpace').html(data); });
        return false;
    });

    $(".openPdf").button().click(function () {
        window.open($(this).attr("id"));
    });

    $(".showEdit").button().click(function () {
        //$('.ajaxSpace').load('/Document/Edit/' + $(this).attr('class'));
        //alert($(this).parents().html());
        var id = $(this).attr('id');
        $('.ui-accordion-content-active').load('/Document/Edit/' + id);
    });

    $(".showDetails").button().click(function () {
        //$('.ajaxSpace').load('/Document/Details/' + $(this).attr('class'));
        var id = $(this).attr('id');
        $('.ui-accordion-content-active').load('/Document/Details/' + id);
    });

    $("a[href='#Delete']").click(function () {
        //$('.ajaxSpace').load('/Document/Delete/' + $(this).attr('class'));
        var id = $(this).attr('class');
        $('.ui-accordion-content-active').load('/Document/Delete/' + id);
    });

    if ($('.file').val() != "" && $('.file').length) // wyswietlanie ostrzezenia o niepoprawnym formacie pliku
    {
        var extension = $('.file').val().split('.').pop().toLowerCase(); // "magiczne" pobranie rozszerzenia pliku
        if (extension != "pdf") {
            var $dialog = $('<div></div>')
		        .html('Można dodawać tylko pliki pdf.')
		        .dialog({
		            autoOpen: false,
                    resizable: false,
		            title: 'Błąd!'
		        });
   
             $dialog.dialog('open');
                    
            return false;
        }
    }

    $('.file').change(function () {
        var formData = new FormData($('form')[0]);
        $.ajax({
            url: '/Document/Create',  //server script to process data
            type: 'POST',
            xhr: function () {  // custom xhr
                myXhr = $.ajaxSettings.xhr();
                if (myXhr.upload) { // check if upload property exists
                    myXhr.upload.addEventListener('progress', progressHandlingFunction, false); // for handling the progress of the upload
                }
                return myXhr;
            },
            //Ajax events
            beforeSend: function (data) {
                var extension = $('.file').val().split('.').pop().toLowerCase(); // "magiczne" pobranie rozszerzenia pliku
                if (extension != "pdf") {
                    //alert('Tylko pliki pdf!');
                    return false;
                }

                //uploadFileSize = $('.file')[0].files[0].size;

                $('.ajaxCreateSubmit').button("disable"); $('progress').attr({ value: 0, max: 0 });
                $("#progressbar").progressbar({
                    value: 0
                });
            },
            success: function (data) {
                $('.ajaxCreateSubmit').button("enable"); $('progress').attr({ value: 100, max: 100 });
                $("#progressbar").progressbar({
                    value: 100
                });
            },
            error: function (jqXHR, exception) {
                if (jqXHR.status === 0) {
                    var $dialog = $('<div class="kopytko"></div>')
		            .html('Zbyt duży rozmiar pliku.')
		            .dialog({
		                autoOpen: false,
		                resizable: false,
		                title: 'Błąd!'
		            });

                    $dialog.dialog('open');
                } else if (exception === 'timeout') {
                    var $dialog = $('<div></div>')
		            .html('Przekroczenie dozwolonego czasu.')
                    dialog({
                        autoOpen: false,
                        resizable: false,
                        title: 'Błąd!'
                    });

                    $dialog.dialog('open');
                } else {
                    var $dialog = $('<div></div>')
		            .html('Nieznany błąd: ' + jqXHR.responseText)
		            .dialog({
		                autoOpen: false,
		                resizable: false,
		                title: 'Błąd!'
		            });

                    $dialog.dialog('open');

                }
            },
            // Form data
            data: formData,
            //Options to tell JQuery not to process data or worry about content-type
            cache: false,
            contentType: false,
            processData: false
        });
    });

    
}

function progressHandlingFunction(e) {
    if (e.lengthComputable) {
        $('progress').attr({ value: e.loaded, max: e.total });
        
            $("#progressbar").progressbar({
                value: e.loaded / e.total * 100.0
            });            
        
        
    }
}
