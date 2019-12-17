const selectorShow = () => {
  const idea = document.getElementById('idea-selector');
  const chat = document.getElementById('chat-selector');
  const ideaContainer = document.getElementById('idea-container');
  const chatContainer = document.getElementById('chat-container');
  if (idea && chat) {
    idea.addEventListener('click', (event) => {
      idea.classList.add('active');
      chat.classList.remove('active');
      ideaContainer.classList.remove('hidden');
      chatContainer.classList.add('hidden');
    });
    chat.addEventListener('click', (event) => {
      idea.classList.remove('active');
      chat.classList.add('active');
      ideaContainer.classList.add('hidden');
      chatContainer.classList.remove('hidden');
    });
  }
}

export { selectorShow };
