function modifiedDateJekyllGitHubAPI_getURL() {
  with (window.GitHubAPICall) {
    return "https://api.github.com/repos/" + owner + "/" + repo + "/commits?path=" + path; 
  }
}

function modifiedDateJekyllGitHubAPI() {
  fetch(modifiedDateJekyllGitHubAPI_getURL())
    .then((response) => {
      return response.json();
    })
    .then((commits) => {
      var modified = commits[0]['commit']['committer']['date'];
      window.GitHubJekyllLastModifiedEl.textContent = modified;
    });
}
