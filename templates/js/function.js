function refusHorforfait(idfrais)
{
    var text = prompt("Saissisez le motif de refus", "");
    if (text === "") {
        alert("Veuillez saisir un motif de refus");
    } else {
        location.href = "ControllerGererFrais.php?action=refuserFrais&idFrais="+idfrais+"&text="+encodeURIComponent(text);
    }
}

function deporterHorfait(idfrais, idvisiteur)
{
    confirm("Etes vous sur de vouloir reporter ce frais au mois prochain ?");
    location.href = "ControllerGererFrais.php?action=deporterHorfait&idFrais="+idfrais+"&idVisiteur="+idvisiteur;
}

function edition(url) {
    options = "Width=700,Height=700";
    window.open(url, "edition", options);
}
