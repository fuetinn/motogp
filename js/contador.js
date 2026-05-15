const fechaCarrera = new Date("2026-05-31T14:00:00").getTime();
let timer;

function ActualizarCuentaAtras() {
    const horaActual = new Date().getTime();
    const tiempoRestante = fechaCarrera - horaActual;

    if (tiempoRestante <= 0) {
        document.querySelector(".countdown").innerHTML = "<h3>¡La carrera ha empezado!</h3>";
        clearInterval(timer);
        return;
    }

    const days = Math.floor(tiempoRestante / (1000 * 60 * 60 * 24));
    const hours = Math.floor((tiempoRestante % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((tiempoRestante % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((tiempoRestante % (1000 * 60)) / 1000);

    document.getElementById("days").textContent = days;
    document.getElementById("hours").textContent = hours;
    document.getElementById("minutes").textContent = minutes;
    document.getElementById("seconds").textContent = seconds;
}

ActualizarCuentaAtras(); // inicial inmediato
timer = setInterval(ActualizarCuentaAtras, 1000);
