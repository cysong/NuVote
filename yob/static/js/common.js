function showMessage(message, type) {
    const alertContainer = document.getElementById('alert-container');
    const alert = document.createElement('div');
    alert.className = `alert alert-${type} alert-dismissible fade show`;
    alert.role = 'alert';
    alert.innerHTML = `
        ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    `;
    alertContainer.appendChild(alert);

    // auto hide alert
    setTimeout(() => {
        alert.classList.remove('show');
        alert.classList.add('fade');
        setTimeout(() => {
            alert.remove();
        }, 150);
    }, 5000);
}

function showSuccessMessage(message) {
    showMessage(message, 'success');
}

function showErrorMessage(message) {
    showMessage(message, 'danger');
}

function enter_from_menu() {
    sessionStorage.setItem('fromMenu', 'true');
}

function goBack() {
    var previousPage = sessionStorage.getItem("previousPage");
    if (previousPage && previousPage !== "" && previousPage !== window.location.href) {
        // If there's a previous page and it's not the current page, navigate to the previous page
        window.location.href = previousPage;
    } else {
        // Otherwise, navigate to the homepage
        window.location.href = "/";
    }
}

function formatDateToNZTime(gmtDateStr) {
    const date = new Date(gmtDateStr);

    // Extract day, month, year, hour, minute, and second
    const day = String(date.getDate()).padStart(2, '0');
    const month = String(date.getMonth() + 1).padStart(2, '0'); // Months are zero-indexed
    const year = date.getFullYear();

    let hour = date.getHours();
    const minute = String(date.getMinutes()).padStart(2, '0');
    const second = String(date.getSeconds()).padStart(2, '0');

    // Determine AM or PM
    const ampm = hour >= 12 ? 'PM' : 'AM';
    hour = hour % 12;
    hour = hour ? hour : 12; // The hour '0' should be '12'
    hour = String(hour).padStart(2, '0');

    // Construct the formatted date string
    return `${day}/${month}/${year} ${hour}:${minute}:${second} ${ampm}`;
}