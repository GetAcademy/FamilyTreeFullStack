
function updateViewSingle() {
    const person = model.people.find(p => p.id === model.app.selectedPerson);
    document.getElementById('app').innerHTML = /*html*/`
        <h3>
            ${person.firstName || ''}
            ${person.lastName || ''}
        </h3>
        Født ${person.birthYear}

        <h4>Far</h4>
        <button onclick="goToAddPage((newPerson,selectedPerson)=>selectedPerson.father=newPerson.id)">
            Legg til
        </button>

        <h4>Mor</h4>
        <button onclick="goToAddPage((newPerson,selectedPerson)=>selectedPerson.mother=newPerson.id)">
            Legg til
        </button>
        
        <h4>Barn</h4>
        <button onclick="goToAddPage((newPerson,selectedPerson)=>newPerson.father=selectedPerson.id)">
            Legg til med ${person.firstName || ''} som far
        </button>
        <button onclick="goToAddPage((newPerson,selectedPerson)=>newPerson.father=selectedPerson.id)">
            Legg til med ${person.firstName || ''} som mor
        </button>
    `;
}