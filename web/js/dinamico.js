
function saluda(){
    var nomBArt= 'El libro';
    var nomBAut= 'El autor';
    var fCreacion= '11 abr 2018';
    var fMod= '14 may 2019';
    var textC='Informacin InformacinInformacin Informacin Informacin Informacin Informacin InformacinInformacin Informacin Informacin Informacin Informacin InformacinInformacin Informacin Informacin Informacin';
    var sec1= '<div class="IniCards"><div><img src="iconos/icons8_Database_104px.png" class="IniCardsImg" alt=""></div><div class="iniConCardsSec"><a href="#" class="IniCardsTitulo">';
    
    var sec2='</a><div><div class="iniConCardsSec"><p class="IniCardInfoRel">Conjunto de datos por</p><a href="#" class="IniCardInfoRel">';
    var sec3='</a> |<p class="IniCardInfoRel"> Fecha de creación ';
    var sec4='</p> |<p class="IniCardInfoRel"> Ultima modificación ';
    var sec5='</p></div><p class="IniCardsInformacion">';
    var sec6= '</p> </div></div></div>';
    var cadenaF=sec1+nomBArt+sec2+nomBAut+sec3+fCreacion+sec4+fMod+sec5+textC+sec6;
     $("#contenedores").append(cadenaF);
}
