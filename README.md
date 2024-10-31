# repo-finder

Directions:

Develop a "getgit" script that will recursively search all subdirectories for git repositories and return the following tab-separated text. The default behavior (e.g., no arguments) should be to begin in the pwd. The command should accept a series of qualified or unqualified paths from which to begin the search tree.

Command Modifiers:

Your "getgit" script should respond to:

- a "--quiet" or "-q" flag that does not display the `<path#>` information.
- a "--help" or "-h" flag that displays the usage/command style in a standard Linux format.
- a "--branch" or "-b" flag that appends the current branch for each repository after the `<repository name>`.
- a "--tricks" or "-t" flag that describes the core functions used in your script for finding the information needed and only displaying that which is needed (e.g., a clear and concise algorithm summary of what Linux commands were used).

Sample output:

```sh
$ gitget path0 path1

<path0>

<repository path> <repository name> 

<repository path> <repository name> 

<path1>

<repository path> <repository name> 