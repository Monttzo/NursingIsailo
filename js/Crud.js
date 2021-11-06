// Crud Registrar
$(function() {  

    $('.btnCrudRe').click(function() {

        toggleCrudRe();
    });  
});

function toggleCrudRe() {
    if ($('.Interno').hasClass('jsCrudRe')) {

        $('.Interno').removeClass('jsCrudRe');
    } else {

        $('.Interno').addClass('jsCrudRe');
    }

}
// Crud Consultar
$(function() {  

    $('.btnCrudCon').click(function() {

        toggleCrudCo();
    });  
});

function toggleCrudCo() {
    if ($('.Interno').hasClass('jsCrudCon')) {

        $('.Interno').removeClass('jsCrudCon');
    } else {
 
        $('.Interno').addClass('jsCrudCon');
    }

}
// Crud Modificar
$(function() {  

    $('.btnCrudMo').click(function() {

        toggleCrudMo();
    });  
});

function toggleCrudMo() {
    if ($('.Interno').hasClass('jsCrudMo')) {

        $('.Interno').removeClass('jsCrudMo');
    } else {

        $('.Interno').addClass('jsCrudMo');
    }
}
// Crud Activar o Inactivar
$(function() {  

    $('.btnCrudAc').click(function() {

        toggleCrudAc();
    });  
});

function toggleCrudAc() {
    if ($('.Interno').hasClass('jsCrudAc')) {

        $('.Interno').removeClass('jsCrudAc');
    } else {

        $('.Interno').addClass('jsCrudAc');
    }
}