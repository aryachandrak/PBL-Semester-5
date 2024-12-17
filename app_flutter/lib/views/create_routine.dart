import 'package:flutter/material.dart';
import 'package:plugin_camera/widgets/theme.dart';
import 'package:provider/provider.dart';
import '../models/routine.dart';
import '../provider/routine_provider.dart';

class CreateRoutine extends StatefulWidget {
  @override
  _CreateRoutineState createState() => _CreateRoutineState();
}

class _CreateRoutineState extends State<CreateRoutine> {
  final TextEditingController _nameController = TextEditingController();
  List<RoutineStep> _steps = [
    RoutineStep(stepName: "Facewash"),
    RoutineStep(stepName: "Toner"),
    RoutineStep(stepName: "Treatmment"),
    RoutineStep(stepName: "Moisturizer"),
    RoutineStep(stepName: "Sunscreen"),
  ];
  List<String> _selectedDays = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];
  String _selectedTime = 'Morning';
  bool _reminder = false;

  void _addNewStep() {
    setState(() {
      _steps.add(RoutineStep(stepName: "New Step"));
    });
  }

  void _saveRoutine() {
    final newRoutine = Routine(
      name: _nameController.text,
      steps: _steps,
      days: _selectedDays,
      time: _selectedTime,
      reminder: _reminder,
    );
    Provider.of<RoutineProvider>(context, listen: false).addRoutine(newRoutine);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          textAlign: TextAlign.center,
          "Create New Routine",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: _saveRoutine,
            child: Text("Save", style: TextStyle(color: primary)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration:
                    const InputDecoration(labelText: "Edit Routine Name"),
              ),
              const SizedBox(height: 20),
              ..._steps.map((step) => ListTile(
                    leading: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _steps.remove(step);
                        });
                      },
                    ),
                    title: Text(step.stepName),
                    subtitle: Text(step.product ?? "Add Your Product"),
                    trailing: const Icon(Icons.drag_handle),
                    onTap: () async {
                      String? product = await showDialog<String>(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text("Add Product"),
                          content: TextField(
                            onSubmitted: (value) =>
                                Navigator.pop(context, value),
                          ),
                        ),
                      );
                      if (product != null) {
                        setState(() {
                          step.product = product;
                        });
                      }
                    },
                  )),
              TextButton.icon(
                onPressed: _addNewStep,
                icon: Icon(Icons.add, color: primary),
                label: Text("Add New Step", style: TextStyle(color: primary)),
              ),
              const Divider(),
              Text("A day to do routine", style: medium16),
              Wrap(
                spacing: 8,
                children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                    .map((day) => ChoiceChip(
                          label: Text(day),
                          selected: _selectedDays.contains(day),
                          selectedColor: primary,
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _selectedDays.add(day);
                              } else {
                                _selectedDays.remove(day);
                              }
                            });
                          },
                        ))
                    .toList(),
              ),
              const SizedBox(height: 20),
               Text("What time to do the routine?", style: medium16),
              Row(
                children: ['Morning', 'Night', 'Anytime']
                    .map((time) => Expanded(
                          child: ChoiceChip(
                            label: Text(time),
                            selected: _selectedTime == time,
                            selectedColor: primary,
                            onSelected: (selected) {
                              setState(() {
                                _selectedTime = time;
                              });
                            },
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 20),
              SwitchListTile(
                title:  Text("Remind me to do a routine", style: medium16),
                value: _reminder,
                onChanged: (value) {
                  setState(() {
                    _reminder = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
