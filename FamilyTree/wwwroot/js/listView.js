function updateViewList() {
    document.getElementById('app').innerHTML =
        model.people.map(p =>/*html*/`
        <li>
            ${p.firstName || ''} 
            ${p.lastName || ' '} 
            <small>født</small> ${p.birthYear} 
            <a href="javascript:goToSinglePage(${p.id})"><small>velg</small></a>
        </li>
    `).join('');
}