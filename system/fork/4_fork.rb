pid1 = fork { sleep 3; exit 3 }
pid2 = fork { sleep 1; exit 3 }

p Process.waitpid(pid1)
p Process.waitpid2(pid2)
