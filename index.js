const projects = [
    {
        title: "Perlin Noise Generator",
        gif: "Images/ProjectImages/ProjectGifs/PerlinNoiseShowcase.gif",
        image: "",
        link: "#",
        description: "This project was programmed in C++ and GLSL using OpenGL for graphics rendering. Users are able to use custom User Interface to effect the Perlin Noise image that is generated."
        
    },
    {
        title: "",
        gif: "",
        image: "",
        link: "#",
        description: ""
    },
    {
        title: "",
        gif: "",
        image: "",
        link: "#",
        description: ""
    },
    {
        title: "",
        gif: "",
        image: "",
        link: "#",
        description: ""
    },
    {
        title: "",
        gif: "",
        image: "",
        link: "#",
        description: ""
    },
    {
        title: "",
        gif: "",
        image: "",
        link: "#",
        description: ""
    },
];

const grid = document.getElementById("project-grid");

for(const project of projects){
    const projectCard = `
        <button class="project-card" href="${project.link}">
            <img src="${project.gif}" alt="${project.title}">
            <h3>${project.title}</h3>
            <p>${project.description}</p>
        </button>    
    `;
    grid.innerHTML += projectCard;
}