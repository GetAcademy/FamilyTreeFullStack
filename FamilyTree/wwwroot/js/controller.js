async function getPeople() {
    let response = await axios.get('/people');
    model.people = response.data;
    updateView();
}

function goToSinglePage(id) {
    model.app.selectedPerson = id;
    model.app.page = 'single';
    updateView();
}

function goToAddPage(addRelationshopFunction) {
    model.inputs.addPage.addRelationshopFunction = addRelationshopFunction;
    model.inputs.addPage.person = {};
    model.app.page = 'add';
    updateView();
}

function addPerson() {
    const selectedPerson = model.people.find(p=>p.id===model.app.selectedPerson);
    const newPerson = { ...model.inputs.addPage.person };
    newPerson.id = 1 + Math.max(...model.people.map(p => p.id));
    model.inputs.addPage.addRelationshopFunction(newPerson, selectedPerson);
    model.app.page = 'single';
    model.app.selectedPerson = newPerson.id;
    model.people.push(newPerson);
    updateView();
}