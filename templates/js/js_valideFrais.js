//affichage des données des visiteurs du mois 
$(document).ready(function () {

    $('select#visiteur').change(function () {
//On récupère le nom
        var value = $(this).val();
        $('#name').html(value);
        $('#lastname').html(value);
        var i = 0;
        var url = './controleurs/c_ListeFrais.php';

        $.ajax({
            type: "POST",
            url: url,
            dataType: "JSON",
            data: "name=" + value,
            success: function (data) {
                $('span#prix').each(function () {
                    var ligne = data;
                    $(this).html(ligne[i].quantite);
                    i++;
                });
            }
        });

        var url = './controleurs/c_ListeHorsFrais.php';
        $.ajax({
            type: "POST",
            url: url,
            dataType: "JSON",
            data: "name=" + value,
            success: function (data) {
                $('#horsforfait').html('');
                data.forEach(function (element) {
                    $('#horsforfait').append("<div>"
                                                + "<div class='col-md-6'>" + element.libelle + "</div>"
                                                + "<div class='col-md-2'>" + element.nbJustificatifs + "</div>"
                                                + "<div class='col-md-4'>" + element.montant + "</div>" +
                                            "</div>")
                    console.log(element); // affiche "3", "5", "7"
                });
            }
        });

    });
});