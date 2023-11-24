import 'package:flutter/material.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final Function onConfirm;

  DeleteConfirmationDialog({required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete Account'),
      content: Text('Are you sure you want to delete your account? This action is irreversible.'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            onConfirm(); // Call the callback function to delete the account
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Delete'),
        ),
      ],
    );
  }
}
