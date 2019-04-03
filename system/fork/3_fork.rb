pid1 = fork { sleep 3; exit 3 }
pid2 = fork { sleep 1; exit 3 }

p Process.wait  # wait ждёт завершения любого процесса и возвращает pid
# wait2 ждёт завершения любого процесса и возвращает pid и статус Process::Status
# exit можно передавать true - 0 - успешное завершение,
# false - 1 - ошибка, либо произвольное число
p Process.wait2
