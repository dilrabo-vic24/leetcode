class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val      # Tugundagi qiymat
        self.next = next    # Keyingi tugun



def print_list(head: ListNode):
    while head:
        print(head.val, end=" -> ")
        head = head.next
    print("None")

node1: ListNode = [1, 2, 3]
# Chaqarish
print_list(node1)
