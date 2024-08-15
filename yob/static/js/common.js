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
    }, 3000);
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
    // Define the options for formatting
    const options = {
        timeZone: 'Pacific/Auckland', // New Zealand time zone
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
        hour12: false // Use 24-hour time
    };

    // Create a formatter for New Zealand time
    const formatter = new Intl.DateTimeFormat('en-NZ', options);

    // Format the date
    return formatter.format(date);
}