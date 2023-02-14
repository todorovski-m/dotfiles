from ranger.api.commands import *


class cd_fzf(Command):
    def execute(self):
        import subprocess
        import os.path
        fzf = self.fm.execute_command(
            'find . -type d | fzf ', universal_newlines=True, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_dir = os.path.abspath(stdout.rstrip('\n'))
            self.fm.cd(fzf_dir)


class goto_bookmarks(Command):
    def execute(self):
        import subprocess
        fzf = self.fm.execute_command(
            'cat ~/.config/zsh/bookmarks.txt | fzf', universal_newlines=True, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_dir = stdout.rstrip('\n')
            self.fm.cd(fzf_dir)
