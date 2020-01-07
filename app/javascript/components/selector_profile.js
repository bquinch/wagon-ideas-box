const selectorProfile = () => {
  const idea = document.getElementById('user-idea-selector');
  const fav = document.getElementById('user-fav-selector');
  const participate = document.getElementById('user-participate-selector');
  const ideaContainer = document.getElementById('user-ideas');
  const favContainer = document.getElementById('favorite-ideas');
  const participateContainer = document.getElementById('participant-ideas');
  if (idea && fav && participate) {
    idea.addEventListener('click', (event) => {
      idea.classList.add('active');
      fav.classList.remove('active');
      participate.classList.remove('active');
      ideaContainer.classList.remove('hidden');
      favContainer.classList.add('hidden');
      participateContainer.classList.add('hidden');
    });
    fav.addEventListener('click', (event) => {
      idea.classList.remove('active');
      fav.classList.add('active');
      participate.classList.remove('active');
      ideaContainer.classList.add('hidden');
      favContainer.classList.remove('hidden');
      participateContainer.classList.add('hidden');
    });
    participate.addEventListener('click', (event) => {
      idea.classList.remove('active');
      fav.classList.remove('active');
      participate.classList.add('active');
      ideaContainer.classList.add('hidden');
      favContainer.classList.add('hidden');
      participateContainer.classList.remove('hidden');
    });
  }
}

export { selectorProfile };
