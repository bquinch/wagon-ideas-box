const selectorShow = () => {
  const idea = document.getElementById('idea-selector');
  const chat = document.getElementById('chat-selector');
  const team = document.getElementById('team-selector');
  const ideaContainer = document.getElementById('idea-container');
  const chatContainer = document.getElementById('chat-container');
  const teamContainer = document.getElementById('team-container');
  if (idea && chat && team) {
    idea.addEventListener('click', (event) => {
      idea.classList.add('active');
      chat.classList.remove('active');
      team.classList.remove('active');
      ideaContainer.classList.remove('hidden');
      chatContainer.classList.add('hidden');
      teamContainer.classList.add('hidden');
    });
    chat.addEventListener('click', (event) => {
      idea.classList.remove('active');
      chat.classList.add('active');
      team.classList.remove('active');
      ideaContainer.classList.add('hidden');
      chatContainer.classList.remove('hidden');
      teamContainer.classList.add('hidden');
    });
    team.addEventListener('click', (event) => {
      idea.classList.remove('active');
      chat.classList.remove('active');
      team.classList.add('active');
      ideaContainer.classList.add('hidden');
      chatContainer.classList.add('hidden');
      teamContainer.classList.remove('hidden');
    });
  }
}

export { selectorShow };
