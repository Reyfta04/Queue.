import 'dart:io';

class CircularQueue {
  List<int?> queue;
  int front;
  int rear;
  int capacity;
  int size;

  CircularQueue(this.capacity)
      : queue = List<int?>.filled(capacity, null),
        front = 0,
        rear = -1,
        size = 0;

  bool isFull() => size == capacity;
  bool isEmpty() => size == 0;

  void enqueue(int element) {
    if (isFull()) {
      print("Antrian penuh");
    } else {
      rear = (rear + 1) % capacity;
      queue[rear] = element;
      size++;
      print('$element dimasukkan ke antrian.');
    }
  }

  int? dequeue() {
    if (isEmpty()) {
      print("Antrian kosong");
      return null;
    } else {
      int? element = queue[front];
      queue[front] = null;
      front = (front + 1) % capacity;
      size--;
      return element;
    }
  }

  void display() {
    if (isEmpty()) {
      print("Antrian kosong");
    } else {
      print("Isi antrian:");
      int index = front;
      for (int i = 0; i < size; i++) {
        print(queue[index]);
        index = (index + 1) % capacity;
      }
    }
  }
}

void main() {
  var q = CircularQueue(5);
  q.enqueue(10);
  q.enqueue(20);
  q.enqueue(30);
  q.display();
  print('Mengambil data: ${q.dequeue()}');
  q.display();
}
