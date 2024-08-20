import { randomId } from "../utils";
import { register, logout, login } from "../components/user";
import { DEFAULT_PASSWORD } from "../constants";

const username = randomId("bird");

describe("Voter", () => {
    it("Register new user", () => {
        register(username, username + "@example.com");
        cy.wait(1000);
        logout();
    });
    it("Login and out as voter", () => {
        login(username, DEFAULT_PASSWORD);
        cy.wait(1000);
        logout();
    });
});

