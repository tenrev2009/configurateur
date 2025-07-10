// Exemple de skeleton pour l’interaction avec SketchUp via la WebDialog API

// Dès que la page est chargée, on peut demander à Ruby la liste des attributs
document.addEventListener('DOMContentLoaded', function() {
  // TODO : appeler window.location = 'skp:request_attributes@?' pour récupérer les attributs
});

// Quand l’utilisateur clique sur Appliquer :
document.getElementById('apply-btn').addEventListener('click', function() {
  // Récupérer les valeurs du formulaire
  const params = {};
  document.querySelectorAll('#form-container input, #form-container select').forEach(elem => {
    params[elem.name] = elem.value;
  });
  // Envoyer à SketchUp : skp:apply_settings@JSON_ENCODED(params)
  // Par exemple :
  // window.location = 'skp:apply_settings@' + encodeURIComponent(JSON.stringify(params));
});