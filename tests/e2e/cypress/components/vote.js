export function cast_a_vote(competition_id) {
    cy.visit("/");
    cy.get(`a[href='/competition/vote/${competition_id}`).click();
    cy.get(".competition-card").find("h5.card-title").should('be.visible');
    cy.get(".col:nth-child(1) .btn").click();
    cy.wait(500);
    cy.get("#confirmVoteBtn").click();
    cy.get(".col:nth-child(1) .vote-status").should("have.text", "Voted");
}
