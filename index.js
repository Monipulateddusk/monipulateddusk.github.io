const projects = [
    {
        title: "",
        image: "",
        link: "#",
        description: ""
    },
    {
        title: "",
        image: "",
        link: "#",
        description: ""
    },
    {
        title: "",
        image: "",
        link: "#",
        description: ""
    },
    {
        title: "",
        image: "",
        link: "#",
        description: ""
    },
    {
        title: "",
        image: "",
        link: "#",
        description: ""
    },
    {
        title: "",
        image: "",
        link: "#",
        description: ""
    },
];

const grid = document.getElementById("project-grid");

for(const project of projects){
    const projectCard = `
        <button class="project-card" href="${project.link}">
            <img src="${project.image}" alt="${project.title}">
            <h3>${project.title}</h3>
            <p>${project.description}</p>
        </button>    
    `;
    grid.innerHTML += projectCard;
}