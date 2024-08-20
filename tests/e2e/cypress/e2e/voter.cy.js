import { register, logout, login } from "../components/user";
import { VOTER_USERNAME, COMPETITION_ID_TO_VOTE, DEFAULT_PASSWORD } from "../constants";
import { cast_a_vote } from "../components/vote";

const username = VOTER_USERNAME;

describe("Voter", () => {
    afterEach(() => {
        logout();
    });
    it("Register new user", () => {
        cy.log("Registering new user: " + username);
        register(username, username + "@example.com");
        cy.wait(1000);
    });
    it("Login as voter", () => {
        login(username, DEFAULT_PASSWORD);
    });
    it("Cast a vote", () => {
        login(username, DEFAULT_PASSWORD);
        cast_a_vote(COMPETITION_ID_TO_VOTE);
    });
});
