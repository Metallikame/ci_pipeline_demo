#!/bin/bash

echo "---- Début du pipeline CI ----"
echo "Étape 1 : Lancement des tests avec Python..."

python -m unittest test_main.py > output.log 2>&1

if grep -q "FAILED" output.log; then
    echo "❌ Tests échoués. Interruption du pipeline."
    echo "Consultez output.log pour plus d'informations."
    echo "$(date) - ÉCHEC" >> logs.txt
else
    echo "✅ Tous les tests ont réussi !"
    echo "Étape 2 : Déploiement fictif..."
    echo "[OK] Déploiement effectué."
    echo "$(date) - SUCCÈS" >> logs.txt

    echo "Étape 3 : Vérification du style (PEP8)..."
    pycodestyle main.py > style_report.txt

    if [ -s style_report.txt ]; then
        echo "⚠️ Problèmes de style détectés dans main.py :"
        cat style_report.txt
    else
        echo "✅ Style conforme PEP8."
    fi
fi

echo "---- Fin du pipeline ----"
read -p "Appuyez sur Entrée pour fermer..."
