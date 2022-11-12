import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
  int currentSteps = 0;
  Color inputBackground = const Color.fromRGBO(238, 238, 238, 1);
  bool isUnShowPass = true;
  bool isUnShowConfirm = true;
  bool isCheckBoxChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: darkBlue,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Stepper(
            margin: EdgeInsets.zero,
            elevation: 0,
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentSteps,
            onStepContinue: () {
              if (currentSteps < getSteps().length - 1) {
                setState(() {
                  currentSteps += 1;
                });
              }
            },
            onStepCancel: () {
              if (currentSteps > 0) {
                setState(() {
                  currentSteps -= 1;
                });
              }
            },
            onStepTapped: (value) {
              setState(() {
                currentSteps = value;
              });
            },
            controlsBuilder: (context, details) {
              return Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: darkBlue,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: details.onStepCancel,
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: lightBlue,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        color: Colors.white,
                        onPressed: details.onStepContinue,
                        icon: const Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          isActive: currentSteps >= 0,
          content: page1(),
          title: const Text(''),
          label: currentSteps == 0 ? const Text('Account') : null,
          state: currentSteps >= 1
              ? StepState.complete
              : (currentSteps == 0 ? StepState.editing : StepState.indexed),
        ),
        Step(
          isActive: currentSteps >= 1,
          content: page2(),
          title: const Text(''),
          label: currentSteps == 1 ? const Text('Your Infomation') : null,
          state: currentSteps >= 2
              ? StepState.complete
              : (currentSteps == 1 ? StepState.editing : StepState.indexed),
        ),
        Step(
          isActive: currentSteps >= 2,
          content: page3(),
          title: const Text(''),
          label: currentSteps == 2 ? const Text('Address') : null,
          state: currentSteps >= 3
              ? StepState.complete
              : (currentSteps == 2 ? StepState.editing : StepState.indexed),
        ),
      ];
  Widget page1() {
    return SizedBox(
      height: 430,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Enter your email',
              style: TextStyle(
                color: darkBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.email),
              prefixIconColor: lightBlue,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: lightBlue,
                  width: 2,
                ),
              ),
              fillColor: inputBackground,
              filled: true,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Enter your password',
              style: TextStyle(
                color: darkBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            obscureText: isUnShowPass,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                    isUnShowPass ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    isUnShowPass = !isUnShowPass;
                  });
                },
              ),
              suffixIconColor: lightBlue,
              prefixIconColor: lightBlue,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: lightBlue,
                  width: 2,
                ),
              ),
              fillColor: inputBackground,
              filled: true,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Confirm your password',
              style: TextStyle(
                color: darkBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            obscureText: isUnShowConfirm,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.lock_reset),
              suffixIcon: IconButton(
                icon: Icon(
                    isUnShowConfirm ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    isUnShowConfirm = !isUnShowConfirm;
                  });
                },
              ),
              prefixIconColor: lightBlue,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: lightBlue,
                  width: 2,
                ),
              ),
              fillColor: inputBackground,
              filled: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget page2() {
    return SizedBox(
      height: 430,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Pick your country',
              style: TextStyle(
                color: darkBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.location_city),
              prefixIconColor: lightBlue,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: lightBlue,
                  width: 2,
                ),
              ),
              fillColor: inputBackground,
              filled: true,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Your full name',
              style: TextStyle(
                color: darkBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.person),
              prefixIconColor: lightBlue,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: lightBlue,
                  width: 2,
                ),
              ),
              fillColor: inputBackground,
              filled: true,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Phone number',
              style: TextStyle(
                color: darkBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.phone_android),
              prefixIconColor: lightBlue,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: lightBlue,
                  width: 2,
                ),
              ),
              fillColor: inputBackground,
              filled: true,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Date of birth',
              style: TextStyle(
                color: darkBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.calendar_month),
              suffixIcon: IconButton(
                icon: const Icon(Icons.arrow_drop_down_outlined),
                onPressed: () {},
              ),
              prefixIconColor: lightBlue,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: lightBlue,
                  width: 2,
                ),
              ),
              fillColor: inputBackground,
              filled: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget page3() {
    return SizedBox(
      height: 430,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Address',
              style: TextStyle(
                color: darkBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.location_on_outlined),
              prefixIconColor: lightBlue,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: lightBlue,
                  width: 2,
                ),
              ),
              fillColor: inputBackground,
              filled: true,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Enter your password',
              style: TextStyle(
                color: darkBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            obscureText: isUnShowPass,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                    isUnShowPass ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    isUnShowPass = !isUnShowPass;
                  });
                },
              ),
              suffixIconColor: lightBlue,
              prefixIconColor: lightBlue,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: lightBlue,
                  width: 2,
                ),
              ),
              fillColor: inputBackground,
              filled: true,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Confirm your password',
              style: TextStyle(
                color: darkBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            obscureText: isUnShowConfirm,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.lock_reset),
              suffixIcon: IconButton(
                icon: Icon(
                    isUnShowConfirm ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    isUnShowConfirm = !isUnShowConfirm;
                  });
                },
              ),
              prefixIconColor: lightBlue,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: lightBlue,
                  width: 2,
                ),
              ),
              fillColor: inputBackground,
              filled: true,
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Checkbox(
                shape: const CircleBorder(),
                value: isCheckBoxChecked,
                onChanged: (value) {
                  setState(() {
                    isCheckBoxChecked = value!;
                  });
                },
              ),
              const Text(
                'I agree with',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Terms & Conditions',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
