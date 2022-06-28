function updateViewAdd() {
    document.getElementById('app').innerHTML = /*html*/`
        <h3>Legg til ny person</h3>
        Fornavn:<br/>
        <input 
            type="text" 
            oninput="model.inputs.addPage.person.firstName=this.value"
            value="${model.inputs.addPage.person.firstName||''}"
            /><br/>
        Etternavn:<br/>
        <input 
            type="text" 
            oninput="model.inputs.addPage.person.lastName=this.value"
            value="${model.inputs.addPage.person.lastName||''}"
            /><br/>
        Fødselsår:<br/>
        <input 
            type="number" 
            oninput="model.inputs.addPage.person.birthYear=this.valueAsNumber"
            value="${model.inputs.addPage.person.birthYear||''}"
            /><br/>       
        <button onclick="addPerson()">Legg til</button>     
    `;
}