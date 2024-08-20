import { randomId } from "../utils";

const BASE_URL = "https://comp639nu.pythonanywhere.com";
const DEFAULT_PASSWORD = "Vote@2024";

describe("Register", () => {
    it("Register new user", () => {
        const id = randomId("bird");
        register(id, id + "@example.com");
        logout();
        login(id, DEFAULT_PASSWORD);
        logout();
    });
});

function register(username, email) {
    cy.visit("https://comp639nu.pythonanywhere.com/register");
    cy.get(".container h2.text-center").should("have.text", "Sign Up");
    cy.get("#username").type(username);
    cy.get("#email").type(email);
    cy.get("#first_name").type("Kiwi");
    cy.get("#last_name").type("Tui");
    cy.get("#location").type("Christchurch");
    cy.get("#password").type(DEFAULT_PASSWORD);
    cy.get("#password2").type(DEFAULT_PASSWORD);
    cy.contains(".btn", "Sign Up").click();
    cy.get("#alert-container .alert").should("contain.text", "You have successfully registered!");
    cy.url().should("contains", BASE_URL);
    cy.wait(1000);
}

function login(username, password) {
    cy.visit(BASE_URL + "/login");
    cy.contains("a", "Login").click();
    cy.get("#username").clear();
    cy.get("#username").type(username);
    cy.get("#password").clear();
    cy.get("#password").type(password);
    cy.contains(".btn", "Sign in").click();
    cy.get("#navbarDropdown .profile-small").should("be.visible");
    cy.wait(1000);
}

function logout() {
    cy.url().should("contains", BASE_URL);
    cy.get("#navbarDropdown .profile-small").click();
    cy.wait(1000);
    cy.get(".dropdown-menu").find(".dropdown-item").contains("Logout").click();
    cy.url().should("contains", BASE_URL);
    cy.wait(1000);
}
