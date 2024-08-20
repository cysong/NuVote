import { randomId } from "../utils";
import { register, logout, login } from "../components/user";
import { COMPETITION_ID_TO_VOTE, DEFAULT_PASSWORD } from "../constants";
import { cast_a_vote } from "../components/vote";

const username = randomId("bird");

describe("Voter", () => {
    it("Register new user", () => {
        register(username, username + "@example.com");
        cy.wait(1000);
        logout();
    });
    it("Login as voter", () => {
        login(username, DEFAULT_PASSWORD);
        logout();
    });
    it("Cast a vote", () => {
        login(username, DEFAULT_PASSWORD);
        cast_a_vote(COMPETITION_ID_TO_VOTE);
        logout();
    });
});
