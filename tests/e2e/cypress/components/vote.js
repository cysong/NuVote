export function cast_a_vote(competition_id) {
    cy.visit("/");
    cy.get(`a[href='/competition/vote/${competition_id}`).click();
    cy.get(".competition-card").find("h5.card-title").should("be.visible");
    cy.get(".col:nth-child(1) .btn").click();
    cy.wait(500);
    cy.get("#confirmVoteBtn").click();
    cy.get(".col:nth-child(1) .vote-status").should("have.text", "Voted");
}

// Disable the first row vote of competition
export function disable_vote(competition_id) {
    cy.visit("/competitions");
    cy.get(`.competition-card[data-competition-id='${competition_id}']`)
        .find(".competition-status")
        .should("have.text", "finished")
        .parents(".competition-card")
        .find(".view-votes")
        .click();
    cy.get("h1").should("be.visible");

    cy.get("#dailyVotesChart")
        .should("be.visible")
        .scrollIntoView({ offset: { top: 0, left: 0 } });
    cy.wait(1000);
    cy.get("#competitorsLineChart")
        .should("be.visible")
        .scrollIntoView({ offset: { top: 0, left: 0 } });
    cy.wait(1000);
    cy.get("h2")
        .contains("Votes by Ip")
        .scrollIntoView({ offset: { top: 0, left: 0 } });
    cy.wait(1000);

    cy.get(".ip-table tbody tr:first-child td:first-child a").click();
    cy.get("h1").should("be.visible");

    cy.get(".table tbody tr:first-child")
        .invoke("attr", "data-vote-id")
        .then((vote_id) => {
            cy.log("vote_id: " + vote_id);
        });
    // Click disable button
    cy.get(".table tbody tr:first-child").find(".btn[data-bs-target='#confirmAbandonByIdModal'").click();

    cy.get("#confirmAbandonByIdModal .btn-danger").click();
    cy.get("#confirmAbandonByIdModal .btn-secondary").click();
    // Close the modal by force, click button is not working
    cy.get("#confirmAbandonByIdModal")
        .invoke("removeClass", "show")
        .invoke("css", "display", "none")
        .invoke("attr", "aria-modal", "false")
        .invoke("attr", "aria-hidden", "true")
        .invoke("removeAttr", "role");
    cy.get(".modal-backdrop").invoke("removeClass", "show");

    cy.get("#confirmAbandonByIdModal").should("not.be.visible");

    //check disable status
    cy.get("#status-filter").uncheck({ force: true }).should("not.be.checked");
    cy.get(`.table tr:first-child`).should("contain.text", "invalid");
}
