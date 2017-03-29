# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?
  
  Version control is a system that tracks changes to a software codebase. It allows us to view the entire history of revisions to one or more files, and merge revisions made by different teams. This allows teams of developers to work on a project simultaneously, without disrupting the workflow of their colleagues. It also always you to rollback and fix mistakes that may have been made along the way, without breaking the entire application.

* What is a branch and why would you use one?

  A branch is typically used to make changes to code to add a feature, without directly making changes to the main program (on the master branch). It allows different developers to work on various features simultaneously, and then merge those additions or changes to the master branch.

* What is a commit? What makes a good commit message?

  A commit is basically creating a "save point" in your repository. It allows developers the opportunity to update their code frequently, and create an expansive history of the entire project. It also is a slice in time of the project, and teammates can look back through the history of the project, as well as rollback if needed. 

  A good commit message succinctly mentions the changes made to the file, in a clear and concise way. It also should be voiced in the present tense. It is important to know that others (especially in the future), might be reading the log history, and we want to make sure they understand exactly why we made the commit, and what changes we made.

* What is a merge conflict?

  A merge conflict can happen when the same line(s) in a file are modified by multiple people. Git then does not know which changes to make, and therefore, a merge conflict arises. 