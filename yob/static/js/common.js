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