#!/bin/bash

echo "---- Début du pipeline CI ----"
echo "Étape 1 : Lancement des tests..."

python3 -m unittest test_main.py > output.log 2>&1

if grep -q "FAILED" output.log; then
    echo "❌ Tests échoués. Interruption du pipeline."
    echo "Consultez output.log pour plus d'informations."
    echo "$(date) - ÉCHEC" >> logs.txt
else
    echo "✅ Tous les tests ont réussi !"
    echo "Étape 2 : Déploiement fictif..."
    echo "[OK] Déploiement effectué."
    echo "$(date) - SUCCÈS" >> logs.txt
fi

echo "---- Fin du pipeline ----"
