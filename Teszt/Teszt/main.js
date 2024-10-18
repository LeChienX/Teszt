// main.js
document.addEventListener('DOMContentLoaded', function() {
    const checkbox = document.getElementById('myCheckbox');
    const statusText = document.getElementById('status');

    function updateStatus() {
        if (checkbox.checked) {
            statusText.textContent = 'Beállítás aktív';
        } else {
            statusText.textContent = 'Beállítás inaktív';
        }
    }

    // Frissítés ha változik az állapot
    checkbox.addEventListener('change', updateStatus);

    // Kezdeti állapot beállítása
    updateStatus();
});

