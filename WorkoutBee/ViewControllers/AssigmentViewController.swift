//
//  AssigmentViewController.swift
//  WorkoutBee
//
//  Created by Muskan on 19/09/22.
//

import UIKit
import FirebaseAuth
import Firebase

class AssigmentViewController: UIViewController {

    @IBOutlet weak var firstDay: UIButton!
    @IBOutlet weak var secondDay: UIButton!
    @IBOutlet weak var thirdDay: UIButton!
    @IBOutlet weak var fourthDay: UIButton!
    @IBOutlet weak var fifthDay: UIButton!
    @IBOutlet weak var sixthDay: UIButton!
    
    let vc = QuizViewController()
    var type = 0
    
    let db = Firestore.firestore()
    var answer1 = ""
    var answer2 = ""
    var answer3 = ""
    var count = 0
   
    var  model : [plan] = [
    
        .init(name: "Jumping Jack", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Stand upright with your legs together, arms at your sides.\n2. Bend your knees slightly, and jump into the air.\n3. As you jump, spread your legs to be about shoulder-width apart. Stretch your arms out and over your head.\n4. Jump back to starting position.\n5. Repeat for 30 Times.", animation: "jumping-jack"),
        .init(name: "Jumping Squats", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Stand with your feet shoulder-width apart and the toes pointing slightly outward.\n2. Bend your knees pressing your hips back as if you were going to sit back on a chair.\n3. Pushing through the heels, jump straight up.\n4. Land with your knees slightly bent and go back into the squat position.\n5. Repeat until the set is complete.", animation: "jumping-squats"),
        .init(name: "Punches", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Stand with your feet hip-width apart, your knees slightly bent, and hold a dumbbell in each hand.\n2. Take a step forward with your left foot, keep your back foot at a 45-degree angle and position your body partially sideways.\n3. Bring your arms up, so that the palms of the hands are facing the sides of the face.\n4. Push your right arm out in a punching motion and then return to the starting position.\n5. Switch sides and repeat.", animation: "punches"),
        .init(name: "Frog Press", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1.Lie down.\n2. Hands behind head.\n3. Knees spread apart. Soles of feet together.\n4. Press lower back into mat. Tighten you stomach.\n5. Lift your arms and feet so the palms of your hands come together inside of your knees.\n6. There is no movement of the hip joint.\n7. Lower to original position but don’t relax the press time is up.\n8. Repeat.", animation: "frog-press"),
        .init(name: "Squat Kick", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Start with your feet about shoulder width apart.\n2. Bend at the knees and drop your butt down till your legs make a 90 degree angle.\n3. Stand back up and kick forward with you right leg (alternate kicking legs each repetition).\n4. This completes one repetition.", animation: "squat-kick"),
        .init(name: "Cobras", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Lie down in a prone position.\n2. Bring your hands underneath the shoulder blades.\n3. Begin to lift your upper body.\n4. Use lower back muscles to lift higher.\n5. Look slightly forward and up.\n6. Lower down gently. On an exhale, slowly lower down to the ground.\n7. Transition to the next posture. Two common postures to transition into after cobra are pushing up and back into Balasana (child’s pose) or Adho Mukha Svanasana (downward-facing dog).", animation: "cobras")
    
    ]
    var  model2 : [plan] = [
    
        .init(name: "Jumping Jack", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Stand upright with your legs together, arms at your sides.\n2. Bend your knees slightly, and jump into the air.\n3. As you jump, spread your legs to be about shoulder-width apart. Stretch your arms out and over your head.\n4. Jump back to starting position.\n5. Repeat for 30 Times.", animation: "jumping-jack"),
        .init(name: "Everse Crunshes", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Lie face-up on a mat or other soft surface with your knees bent at 90 degrees and your feet flat on the floor. Keep your arms near your sides with your palms down.\n2. Exhale and brace your core. Lift your feet off the ground and raise your thighs until they’re vertical. Keep your knees bent at 90 degrees throughout the movement.\n3. Tuck your knees toward your face as far as you can comfortably go without lifting your mid-back from the mat. Your hips and lower back should lift off the ground.\n4. Hold for a moment and slowly lower your feet back toward the floor until they reach the ground.\n5. Repeat for at least 10-12 repetitions. Do one set to start, and increase the number of reps and sets as you get stronger.", animation: "everse-crunches"),
        .init(name: "Inch Worm", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Stand straight with your feet shoulder-width apart.\n2. Bend over and touch the floor with the palms of your hands.\n3. Walk your hands out, as far as you can while keeping your legs straight, and pause.\n4. Walk back up to the starting position and repeat until the set is complete.", animation: "inchworm"),
        .init(name: "Lunge", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1.Start in a standing position with your feet hip-width apart.\n2. Step forward longer than a walking stride so one leg is ahead of your torso and the other is behind. Your foot should land flat and remain flat while it’s on the ground. Your rear heel will rise off of the ground.\n3. Bend your knees to approximately 90 degrees as you lower yourself. Remember to keep your trunk upright and core engaged.\n4. Then, forcefully push off from your front leg to return to the starting position.\n5. Repeat.", animation: "lunge"),
        .init(name: "Squat Kick", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Start with your feet about shoulder width apart.\n2. Bend at the knees and drop your butt down till your legs make a 90 degree angle.\n3. Stand back up and kick forward with you right leg (alternate kicking legs each repetition).\n4. This completes one repetition.", animation: "squat-kick"),
        .init(name: "punches", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Stand with your feet hip-width apart, your knees slightly bent, and hold a dumbbell in each hand.\n2. Take a step forward with your left foot, keep your back foot at a 45-degree angle and position your body partially sideways.\n3. Bring your arms up, so that the palms of the hands are facing the sides of the face.\n4. Push your right arm out in a punching motion and then return to the starting position.\n5. Switch sides and repeat.", animation: "punches")
    
    ]
    var  model3 : [plan] = [
    
        .init(name: "Cobras", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Lie down in a prone position.\n2. Bring your hands underneath the shoulder blades.\n3. Begin to lift your upper body.\n4. Use lower back muscles to lift higher.\n5. Look slightly forward and up.\n6. Lower down gently. On an exhale, slowly lower down to the ground.\n7. Transition to the next posture. Two common postures to transition into after cobra are pushing up and back into Balasana (child’s pose) or Adho Mukha Svanasana (downward-facing dog).", animation: "cobras"),
        .init(name: "Inch worm", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Stand straight with your feet shoulder-width apart.\n2. Bend over and touch the floor with the palms of your hands.\n3. Walk your hands out, as far as you can while keeping your legs straight, and pause.\n4. Walk back up to the starting position and repeat until the set is complete.", animation: "inchworm"),
        .init(name: "Military Pushups", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Start in a high plank position with your hands flat on the floor about shoulder-width apart, wrists under shoulders.\n2. Turn your elbows so that they are facing behind you.\n3. \n4. Keeping your body in one long line, bend your arms and lower yourself as close to the floor as you can.\n5. Keep your arms close to your torso as you perform the movement.Push back up to start.\n6. Repeat.", animation: "military-push-ups"),
        .init(name: "Frog Press", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1.Lie down.\n2. Hands behind head.\n3. Knees spread apart. Soles of feet together.\n4. Press lower back into mat. Tighten you stomach.\n5. Lift your arms and feet so the palms of your hands come together inside of your knees.\n6. There is no movement of the hip joint.\n7. Lower to original position but don’t relax the press time is up.\n8. Repeat.", animation: "frog-press"),
        .init(name: "Lunge", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1.Start in a standing position with your feet hip-width apart.\n2. Step forward longer than a walking stride so one leg is ahead of your torso and the other is behind. Your foot should land flat and remain flat while it’s on the ground. Your rear heel will rise off of the ground.\n3. Bend your knees to approximately 90 degrees as you lower yourself. Remember to keep your trunk upright and core engaged.\n4. Then, forcefully push off from your front leg to return to the starting position.\n5. Repeat.", animation: "lunge"),
        .init(name: "Single Leg Hip Rotation", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Raise your right knee until your thigh is parallel to the floor.\n2. Move it out to the side, and then rotate your thigh so your shin is parallel to the floor behind you.\n3. Revert to the start and repeat in reverse.\n4. Repeat with your left leg", animation: "single-leg-hip-rotation")
    
    ]
    var  model4 : [plan] = [
    
        .init(name: "Jumping Jack", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Stand upright with your legs together, arms at your sides.\n2. Bend your knees slightly, and jump into the air.\n3. As you jump, spread your legs to be about shoulder-width apart. Stretch your arms out and over your head.\n4. Jump back to starting position.\n5. Repeat for 30 Times.", animation: "jumping-jack"),
        .init(name: "Jumping Squats", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Stand with your feet shoulder-width apart and the toes pointing slightly outward.\n2. Bend your knees pressing your hips back as if you were going to sit back on a chair.\n3. Pushing through the heels, jump straight up.\n4. Land with your knees slightly bent and go back into the squat position.\n5. Repeat until the set is complete.", animation: "jumping-squats"),
        .init(name: "Squat Kick", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Start with your feet about shoulder width apart.\n2. Bend at the knees and drop your butt down till your legs make a 90 degree angle.\n3. Stand back up and kick forward with you right leg (alternate kicking legs each repetition).\n4. This completes one repetition.", animation: "squat-kick"),
        .init(name: "Squat Reach", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Keep your feet shoulder-width apart and perform a squat by bending at the knees to lower yourself downwards\n2. Your knees should not pass over your toes\n3. From the squat position, straighten and jump upwards, reaching both arms forward.\n4. Repeat.", animation: "sqaut-reach"),
        .init(name: "T Planks", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Start on the floor on your hands and knees.\n2. Place your hands directly under your shoulders.\n3. Step your feet back, one at a time. (For more stability, bring your feet wider than hip-distance apart, and bring them closer for more of a challenge.)\n4. Maintain a straight line from the top of your head through your heels, gaze down just above your fingertips.\n5. Now, tighten your abs, quads, glutes, and hold. Think about digging through your heels, squeezing your quads, and keeping everything nice and tight.\n6. Repeat.", animation: "t-plank-excercise"),
        .init(name: "Military Push Ups", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Start in a high plank position with your hands flat on the floor about shoulder-width apart, wrists under shoulders.\n2. Turn your elbows so that they are facing behind you.\n3. \n4. Keeping your body in one long line, bend your arms and lower yourself as close to the floor as you can.\n5. Keep your arms close to your torso as you perform the movement.Push back up to start.\n6. Repeat.", animation: "military-push-ups")
    
    ]
    var  model5 : [plan] = [
    
        .init(name: "Skipping", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Keep your feet close together when jumping.\n2. Jump on the midsoles of your feet and land softly\n3. Keep your jumping height low (½” - 1” off the ground)\n4. Keep your knees slightly bent at all times\n5. Maintain a tall, neutral spine\n6. Keep your head up, chest up, and head looking forward\n7. Keep your shoulders pulled back and your elbows held down and back\n8. Keep your hands along the midline of your body\n9. Use your wrists to turn the rope (not your elbows or shoulders)\n10. Repeat.", animation: "skipping"),
        .init(name: "Jumping Jack", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Stand upright with your legs together, arms at your sides.\n2. Bend your knees slightly, and jump into the air.\n3. As you jump, spread your legs to be about shoulder-width apart. Stretch your arms out and over your head.\n4. Jump back to starting position.\n5. Repeat for 30 Times.", animation: "jumping-jack"),
        .init(name: "Punches", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Stand with your feet hip-width apart, your knees slightly bent, and hold a dumbbell in each hand.\n2. Take a step forward with your left foot, keep your back foot at a 45-degree angle and position your body partially sideways.\n3. Bring your arms up, so that the palms of the hands are facing the sides of the face.\n4. Push your right arm out in a punching motion and then return to the starting position.\n5. Switch sides and repeat.", animation: "punches"),
        .init(name: "Squat Kick", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Start with your feet about shoulder width apart.\n2. Bend at the knees and drop your butt down till your legs make a 90 degree angle.\n3. Stand back up and kick forward with you right leg (alternate kicking legs each repetition).\n4. This completes one repetition.", animation: "squat-kick"),
        .init(name: "Step up on Chair", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Walkup to the chair with chair-sit facing in front of you.\n2. You should be 2 feet away from the chair.\n3. Next, take your right foot, step up and continue looking all the straight ahead and then stay back down.\n4. Similarly, switch legs, step back up and come down.\n5. Repeat.", animation: "step-up-on-chair"),
        .init(name: "Single leg hip rotation", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Raise your right knee until your thigh is parallel to the floor.\n2. Move it out to the side, and then rotate your thigh so your shin is parallel to the floor behind you.\n3. Revert to the start and repeat in reverse.\n4. Repeat with your left leg", animation: "single-leg-hip-rotation")
    
    ]
    var  model6 : [plan] = [
    
        .init(name: "Jumping Squats", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Stand with your feet shoulder-width apart and the toes pointing slightly outward.\n2. Bend your knees pressing your hips back as if you were going to sit back on a chair.\n3. Pushing through the heels, jump straight up.\n4. Land with your knees slightly bent and go back into the squat position.\n5. Repeat until the set is complete.", animation: "jumping-squats"),
        .init(name: "Squat Reach", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Keep your feet shoulder-width apart and perform a squat by bending at the knees to lower yourself downwards\n2. Your knees should not pass over your toes\n3. From the squat position, straighten and jump upwards, reaching both arms forward.\n4. Repeat.", animation: "squat-reach"),
        .init(name: "Squats Kicks", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Start with your feet about shoulder width apart.\n2. Bend at the knees and drop your butt down till your legs make a 90 degree angle.\n3. Stand back up and kick forward with you right leg (alternate kicking legs each repetition).\n4. This completes one repetition.", animation: "squat-kick"),
        .init(name: "Staggered Puchups", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Get into a press-up position with your hands staggered, so your right is further forward then the left.\n2.  Lower your body until your chest is an inch from the ground then drive up explosively.\n3. Pull your hands off the floor and switch positions so your left leads.\n4. repeat.", animation: "staggered-push-ups"),
        .init(name: "Military Pushups", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Start in a high plank position with your hands flat on the floor about shoulder-width apart, wrists under shoulders.\n2. Turn your elbows so that they are facing behind you.\n3. \n4. Keeping your body in one long line, bend your arms and lower yourself as close to the floor as you can.\n5. Keep your arms close to your torso as you perform the movement.Push back up to start.\n6. Repeat.", animation: "military-push-ups"),
        .init(name: "T planks", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Start on the floor on your hands and knees.\n2. Place your hands directly under your shoulders.\n3. Step your feet back, one at a time. (For more stability, bring your feet wider than hip-distance apart, and bring them closer for more of a challenge.)\n4. Maintain a straight line from the top of your head through your heels, gaze down just above your fingertips.\n5. Now, tighten your abs, quads, glutes, and hold. Think about digging through your heels, squeezing your quads, and keeping everything nice and tight.\n6. Repeat.", animation: "t-plank-excercise")
    
    ]
    
    var  model21 : [plan] = [
    
        .init(name: "Skipping", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Keep your feet close together when jumping.\n2. Jump on the midsoles of your feet and land softly\n3. Keep your jumping height low (½” - 1” off the ground)\n4. Keep your knees slightly bent at all times\n5. Maintain a tall, neutral spine\n6. Keep your head up, chest up, and head looking forward\n7. Keep your shoulders pulled back and your elbows held down and back\n8. Keep your hands along the midline of your body\n9. Use your wrists to turn the rope (not your elbows or shoulders)\n10. Repeat.", animation: "skipping"),
        .init(name: "Jumping Jack", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Stand upright with your legs together, arms at your sides.\n2. Bend your knees slightly, and jump into the air.\n3. As you jump, spread your legs to be about shoulder-width apart. Stretch your arms out and over your head.\n4. Jump back to starting position.\n5. Repeat for 30 Times.", animation: "jumping-jack"),
        .init(name: "Jumping Squats", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Stand with your feet shoulder-width apart and the toes pointing slightly outward.\n2. Bend your knees pressing your hips back as if you were going to sit back on a chair.\n3. Pushing through the heels, jump straight up.\n4. Land with your knees slightly bent and go back into the squat position.\n5. Repeat until the set is complete.", animation: "jumping-squats"),
        .init(name: "Staggered Puchups", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Get into a press-up position with your hands staggered, so your right is further forward then the left.\n2.  Lower your body until your chest is an inch from the ground then drive up explosively.\n3. Pull your hands off the floor and switch positions so your left leads.\n4. repeat.", animation: "staggered-push-ups"),
        .init(name: "Military Pushups", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Start in a high plank position with your hands flat on the floor about shoulder-width apart, wrists under shoulders.\n2. Turn your elbows so that they are facing behind you.\n3. \n4. Keeping your body in one long line, bend your arms and lower yourself as close to the floor as you can.\n5. Keep your arms close to your torso as you perform the movement.Push back up to start.\n6. Repeat.", animation: "military-push-ups"),
        .init(name: "T planks", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Start on the floor on your hands and knees.\n2. Place your hands directly under your shoulders.\n3. Step your feet back, one at a time. (For more stability, bring your feet wider than hip-distance apart, and bring them closer for more of a challenge.)\n4. Maintain a straight line from the top of your head through your heels, gaze down just above your fingertips.\n5. Now, tighten your abs, quads, glutes, and hold. Think about digging through your heels, squeezing your quads, and keeping everything nice and tight.\n6. Repeat.", animation: "t-plank-exercise")
    
    ]
    var  model22 : [plan] = [
    
        .init(name: "Skipping", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Keep your feet close together when jumping.\n2. Jump on the midsoles of your feet and land softly\n3. Keep your jumping height low (½” - 1” off the ground)\n4. Keep your knees slightly bent at all times\n5. Maintain a tall, neutral spine\n6. Keep your head up, chest up, and head looking forward\n7. Keep your shoulders pulled back and your elbows held down and back\n8. Keep your hands along the midline of your body\n9. Use your wrists to turn the rope (not your elbows or shoulders)\n10. Repeat.", animation: "skipping"),
        .init(name: "Jumping Jack", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Stand upright with your legs together, arms at your sides.\n2. Bend your knees slightly, and jump into the air.\n3. As you jump, spread your legs to be about shoulder-width apart. Stretch your arms out and over your head.\n4. Jump back to starting position.\n5. Repeat for 30 Times.", animation: "jumping-jack"),
        .init(name: "Punches", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Stand with your feet hip-width apart, your knees slightly bent, and hold a dumbbell in each hand.\n2. Take a step forward with your left foot, keep your back foot at a 45-degree angle and position your body partially sideways.\n3. Bring your arms up, so that the palms of the hands are facing the sides of the face.\n4. Push your right arm out in a punching motion and then return to the starting position.\n5. Switch sides and repeat.", animation: "punches"),
        .init(name: "Squat Kick", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Start with your feet about shoulder width apart.\n2. Bend at the knees and drop your butt down till your legs make a 90 degree angle.\n3. Stand back up and kick forward with you right leg (alternate kicking legs each repetition).\n4. This completes one repetition.", animation: "squat-kick"),
        .init(name: "Step up on Chair", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Walkup to the chair with chair-sit facing in front of you.\n2. You should be 2 feet away from the chair.\n3. Next, take your right foot, step up and continue looking all the straight ahead and then stay back down.\n4. Similarly, switch legs, step back up and come down.\n5. Repeat.", animation: "step-up-on-chair"),
        .init(name: "Single hip leg rotation", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Raise your right knee until your thigh is parallel to the floor.\n2. Move it out to the side, and then rotate your thigh so your shin is parallel to the floor behind you.\n3. Revert to the start and repeat in reverse.\n4. Repeat with your left leg", animation: "single-leg-hip-rotation")
    
    ]
    var  model23 : [plan] = [
    
        .init(name: "Jumping Jack", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Stand upright with your legs together, arms at your sides.\n2. Bend your knees slightly, and jump into the air.\n3. As you jump, spread your legs to be about shoulder-width apart. Stretch your arms out and over your head.\n4. Jump back to starting position.\n5. Repeat for 30 Times.", animation: "jumping-jack"),
        .init(name: "Jumping Squats", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Stand with your feet shoulder-width apart and the toes pointing slightly outward.\n2. Bend your knees pressing your hips back as if you were going to sit back on a chair.\n3. Pushing through the heels, jump straight up.\n4. Land with your knees slightly bent and go back into the squat position.\n5. Repeat until the set is complete.", animation: "jumping-squats"),
        .init(name: "Squat Kick", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Start with your feet about shoulder width apart.\n2. Bend at the knees and drop your butt down till your legs make a 90 degree angle.\n3. Stand back up and kick forward with you right leg (alternate kicking legs each repetition).\n4. This completes one repetition.", animation: "squat-kick"),
        .init(name: "Squat Reach", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Keep your feet shoulder-width apart and perform a squat by bending at the knees to lower yourself downwards\n2. Your knees should not pass over your toes\n3. From the squat position, straighten and jump upwards, reaching both arms forward.\n4. Repeat.", animation: "sqaut-reach"),
        .init(name: "T Planks", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Start on the floor on your hands and knees.\n2. Place your hands directly under your shoulders.\n3. Step your feet back, one at a time. (For more stability, bring your feet wider than hip-distance apart, and bring them closer for more of a challenge.)\n4. Maintain a straight line from the top of your head through your heels, gaze down just above your fingertips.\n5. Now, tighten your abs, quads, glutes, and hold. Think about digging through your heels, squeezing your quads, and keeping everything nice and tight.\n6. Repeat.", animation: "t-plank-excercise"),
        .init(name: "Military Push Ups", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Start in a high plank position with your hands flat on the floor about shoulder-width apart, wrists under shoulders.\n2. Turn your elbows so that they are facing behind you.\n3. \n4. Keeping your body in one long line, bend your arms and lower yourself as close to the floor as you can.\n5. Keep your arms close to your torso as you perform the movement.Push back up to start.\n6. Repeat.", animation: "military-push-ups")
    
    ]
    var  model24 : [plan] = [
    
        .init(name: "Jumping Squats", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Stand with your feet shoulder-width apart and the toes pointing slightly outward.\n2. Bend your knees pressing your hips back as if you were going to sit back on a chair.\n3. Pushing through the heels, jump straight up.\n4. Land with your knees slightly bent and go back into the squat position.\n5. Repeat until the set is complete.", animation: "jumping-squats"),
        .init(name: "Squat Reach", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Keep your feet shoulder-width apart and perform a squat by bending at the knees to lower yourself downwards\n2. Your knees should not pass over your toes\n3. From the squat position, straighten and jump upwards, reaching both arms forward.\n4. Repeat.", animation: "squat-reach"),
        .init(name: "Squats Kicks", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Start with your feet about shoulder width apart.\n2. Bend at the knees and drop your butt down till your legs make a 90 degree angle.\n3. Stand back up and kick forward with you right leg (alternate kicking legs each repetition).\n4. This completes one repetition.", animation: "squat-kick"),
        .init(name: "Staggered Puchups", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Get into a press-up position with your hands staggered, so your right is further forward then the left.\n2.  Lower your body until your chest is an inch from the ground then drive up explosively.\n3. Pull your hands off the floor and switch positions so your left leads.\n4. repeat.", animation: "staggered-push-ups"),
        .init(name: "Military Pushups", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Start in a high plank position with your hands flat on the floor about shoulder-width apart, wrists under shoulders.\n2. Turn your elbows so that they are facing behind you.\n3. \n4. Keeping your body in one long line, bend your arms and lower yourself as close to the floor as you can.\n5. Keep your arms close to your torso as you perform the movement.Push back up to start.\n6. Repeat.", animation: "military-push-ups"),
        .init(name: "T planks", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Start on the floor on your hands and knees.\n2. Place your hands directly under your shoulders.\n3. Step your feet back, one at a time. (For more stability, bring your feet wider than hip-distance apart, and bring them closer for more of a challenge.)\n4. Maintain a straight line from the top of your head through your heels, gaze down just above your fingertips.\n5. Now, tighten your abs, quads, glutes, and hold. Think about digging through your heels, squeezing your quads, and keeping everything nice and tight.\n6. Repeat.", animation: "t-plank-excercise")
    
    ]
    var  model25 : [plan] = [
    
        .init(name: "Jumping Jack", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Stand upright with your legs together, arms at your sides.\n2. Bend your knees slightly, and jump into the air.\n3. As you jump, spread your legs to be about shoulder-width apart. Stretch your arms out and over your head.\n4. Jump back to starting position.\n5. Repeat for 30 Times.", animation: "jumping-jack"),
        .init(name: "Everse Crunshes", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Lie face-up on a mat or other soft surface with your knees bent at 90 degrees and your feet flat on the floor. Keep your arms near your sides with your palms down.\n2. Exhale and brace your core. Lift your feet off the ground and raise your thighs until they’re vertical. Keep your knees bent at 90 degrees throughout the movement.\n3. Tuck your knees toward your face as far as you can comfortably go without lifting your mid-back from the mat. Your hips and lower back should lift off the ground.\n4. Hold for a moment and slowly lower your feet back toward the floor until they reach the ground.\n5. Repeat for at least 10-12 repetitions. Do one set to start, and increase the number of reps and sets as you get stronger.", animation: "everse-crunches"),
        .init(name: "Inch Worm", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Stand straight with your feet shoulder-width apart.\n2. Bend over and touch the floor with the palms of your hands.\n3. Walk your hands out, as far as you can while keeping your legs straight, and pause.\n4. Walk back up to the starting position and repeat until the set is complete.", animation: "inchworm"),
        .init(name: "Lunge", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1.Start in a standing position with your feet hip-width apart.\n2. Step forward longer than a walking stride so one leg is ahead of your torso and the other is behind. Your foot should land flat and remain flat while it’s on the ground. Your rear heel will rise off of the ground.\n3. Bend your knees to approximately 90 degrees as you lower yourself. Remember to keep your trunk upright and core engaged.\n4. Then, forcefully push off from your front leg to return to the starting position.\n5. Repeat.", animation: "lunge"),
        .init(name: "Squat Kick", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Start with your feet about shoulder width apart.\n2. Bend at the knees and drop your butt down till your legs make a 90 degree angle.\n3. Stand back up and kick forward with you right leg (alternate kicking legs each repetition).\n4. This completes one repetition.", animation: "squat-kick"),
        .init(name: "punches", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Stand with your feet hip-width apart, your knees slightly bent, and hold a dumbbell in each hand.\n2. Take a step forward with your left foot, keep your back foot at a 45-degree angle and position your body partially sideways.\n3. Bring your arms up, so that the palms of the hands are facing the sides of the face.\n4. Push your right arm out in a punching motion and then return to the starting position.\n5. Switch sides and repeat.", animation: "punches")
    
    ]
    var  model26 : [plan] = [
    
        .init(name: "Squats Kick", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Start with your feet about shoulder width apart.\n2. Bend at the knees and drop your butt down till your legs make a 90 degree angle.\n3. Stand back up and kick forward with you right leg (alternate kicking legs each repetition).\n4. This completes one repetition.", animation: "squat-kick"),
        .init(name: "Squats Reach", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Keep your feet shoulder-width apart and perform a squat by bending at the knees to lower yourself downwards\n2. Your knees should not pass over your toes\n3. From the squat position, straighten and jump upwards, reaching both arms forward.\n4. Repeat.", animation: "squat-reach"),
        .init(name: "Military Pushups", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Start in a high plank position with your hands flat on the floor about shoulder-width apart, wrists under shoulders.\n2. Turn your elbows so that they are facing behind you.\n3. \n4. Keeping your body in one long line, bend your arms and lower yourself as close to the floor as you can.\n5. Keep your arms close to your torso as you perform the movement.Push back up to start.\n6. Repeat.", animation: "military-push-ups"),
        .init(name: "Seated Abs Circles", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1.Seated.\n2. leaning back with hands planted on the ground.\n3. Now, You’ll just make clockwise circles and counterclockwise circles with your legs.\n4. Repeat.", animation: "seated-abs-circles"),
        .init(name: "Shoulder Stretch", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Stand in a doorway and place one arm against the door frame. Your elbow should be a little higher than your shoulder.\n2. Relax your shoulders as you lean forward, allowing your chest and shoulder muscles to stretch. ...\n3. Hold for 15 to 30 seconds.\n4. Repeat 2 to 4 times with each arm.", animation: "shoulder-stretch"),
        .init(name: "Punches", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Stand with your feet hip-width apart, your knees slightly bent, and hold a dumbbell in each hand.\n2. Take a step forward with your left foot, keep your back foot at a 45-degree angle and position your body partially sideways.\n3. Bring your arms up, so that the palms of the hands are facing the sides of the face.\n4. Push your right arm out in a punching motion and then return to the starting position.\n5. Switch sides and repeat.", animation: "punches")
    
    ]
    
    var  model31 : [plan] = [
    
        .init(name: "Jumping Squats", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Stand with your feet shoulder-width apart and the toes pointing slightly outward.\n2. Bend your knees pressing your hips back as if you were going to sit back on a chair.\n3. Pushing through the heels, jump straight up.\n4. Land with your knees slightly bent and go back into the squat position.\n5. Repeat until the set is complete.!", animation: "jumping-squats"),
        .init(name: "Squat Reach", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Keep your feet shoulder-width apart and perform a squat by bending at the knees to lower yourself downwards\n2. Your knees should not pass over your toes\n3. From the squat position, straighten and jump upwards, reaching both arms forward.\n4. Repeat.", animation: "squat-reach"),
        .init(name: "Squats Kicks", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Start with your feet about shoulder width apart.\n2. Bend at the knees and drop your butt down till your legs make a 90 degree angle.\n3. Stand back up and kick forward with you right leg (alternate kicking legs each repetition).\n4. This completes one repetition.", animation: "squat-kick"),
        .init(name: "Staggered Puchups", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Get into a press-up position with your hands staggered, so your right is further forward then the left.\n2.  Lower your body until your chest is an inch from the ground then drive up explosively.\n3. Pull your hands off the floor and switch positions so your left leads.\n4. repeat.", animation: "staggered-push-ups"),
        .init(name: "Military Pushups", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Start in a high plank position with your hands flat on the floor about shoulder-width apart, wrists under shoulders.\n2. Turn your elbows so that they are facing behind you.\n3. \n4. Keeping your body in one long line, bend your arms and lower yourself as close to the floor as you can.\n5. Keep your arms close to your torso as you perform the movement.Push back up to start.\n6. Repeat.", animation: "military-push-ups"),
        .init(name: "T planks", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Start on the floor on your hands and knees.\n2. Place your hands directly under your shoulders.\n3. Step your feet back, one at a time. (For more stability, bring your feet wider than hip-distance apart, and bring them closer for more of a challenge.)\n4. Maintain a straight line from the top of your head through your heels, gaze down just above your fingertips.\n5. Now, tighten your abs, quads, glutes, and hold. Think about digging through your heels, squeezing your quads, and keeping everything nice and tight.\n6. Repeat.", animation: "t-plank-excercise")
    
    ]
    var  model32 : [plan] = [
    
        .init(name: "Squats Kick", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Start with your feet about shoulder width apart.\n2. Bend at the knees and drop your butt down till your legs make a 90 degree angle.\n3. Stand back up and kick forward with you right leg (alternate kicking legs each repetition).\n4. This completes one repetition.", animation: "squat-kick"),
        .init(name: "Squats Reach", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Keep your feet shoulder-width apart and perform a squat by bending at the knees to lower yourself downwards\n2. Your knees should not pass over your toes\n3. From the squat position, straighten and jump upwards, reaching both arms forward.\n4. Repeat.", animation: "squat-reach"),
        .init(name: "Military Pushups", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Start in a high plank position with your hands flat on the floor about shoulder-width apart, wrists under shoulders.\n2. Turn your elbows so that they are facing behind you.\n3. \n4. Keeping your body in one long line, bend your arms and lower yourself as close to the floor as you can.\n5. Keep your arms close to your torso as you perform the movement.Push back up to start.\n6. Repeat.", animation: "military-push-ups"),
        .init(name: "Seated Abs Circles", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1.Seated.\n2. leaning back with hands planted on the ground.\n3. Now, You’ll just make clockwise circles and counterclockwise circles with your legs.\n4. Repeat.", animation: "seated-abs-circles"),
        .init(name: "Shoulder Stretch", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Stand in a doorway and place one arm against the door frame. Your elbow should be a little higher than your shoulder.\n2. Relax your shoulders as you lean forward, allowing your chest and shoulder muscles to stretch. ...\n3. Hold for 15 to 30 seconds.\n4. Repeat 2 to 4 times with each arm.", animation: "shoulder-stretch"),
        .init(name: "Punches", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Stand with your feet hip-width apart, your knees slightly bent, and hold a dumbbell in each hand.\n2. Take a step forward with your left foot, keep your back foot at a 45-degree angle and position your body partially sideways.\n3. Bring your arms up, so that the palms of the hands are facing the sides of the face.\n4. Push your right arm out in a punching motion and then return to the starting position.\n5. Switch sides and repeat.", animation: "punches")
    
    ]
    var  model33 : [plan] = [
    
        .init(name: "Shoulder Stretch", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Stand in a doorway and place one arm against the door frame. Your elbow should be a little higher than your shoulder.\n2. Relax your shoulders as you lean forward, allowing your chest and shoulder muscles to stretch. ...\n3. Hold for 15 to 30 seconds.\n4. Repeat 2 to 4 times with each arm.", animation: "shoulder-stretch"),
        .init(name: "Seated Abs Ciricles", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1.Seated.\n2. leaning back with hands planted on the ground.\n3. Now, You’ll just make clockwise circles and counterclockwise circles with your legs.\n4. Repeat.", animation: "seated-abs-circles"),
        .init(name: "Everse Crunches", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Lie face-up on a mat or other soft surface with your knees bent at 90 degrees and your feet flat on the floor. Keep your arms near your sides with your palms down.\n2. Exhale and brace your core. Lift your feet off the ground and raise your thighs until they’re vertical. Keep your knees bent at 90 degrees throughout the movement.\n3. Tuck your knees toward your face as far as you can comfortably go without lifting your mid-back from the mat. Your hips and lower back should lift off the ground.\n4. Hold for a moment and slowly lower your feet back toward the floor until they reach the ground.\n5. Repeat for at least 10-12 repetitions. Do one set to start, and increase the number of reps and sets as you get stronger.", animation: "everse-crunches"),
        .init(name: "Staggered Pushups", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Get into a press-up position with your hands staggered, so your right is further forward then the left.\n2.  Lower your body until your chest is an inch from the ground then drive up explosively.\n3. Pull your hands off the floor and switch positions so your left leads.\n4. repeat.", animation: "staggered-push-ups"),
        .init(name: "Military Pushups", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Start in a high plank position with your hands flat on the floor about shoulder-width apart, wrists under shoulders.\n2. Turn your elbows so that they are facing behind you.\n3. \n4. Keeping your body in one long line, bend your arms and lower yourself as close to the floor as you can.\n5. Keep your arms close to your torso as you perform the movement.Push back up to start.\n6. Repeat.", animation: "military-push-ups"),
        .init(name: "T Planks", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Start on the floor on your hands and knees.\n2. Place your hands directly under your shoulders.\n3. Step your feet back, one at a time. (For more stability, bring your feet wider than hip-distance apart, and bring them closer for more of a challenge.)\n4. Maintain a straight line from the top of your head through your heels, gaze down just above your fingertips.\n5. Now, tighten your abs, quads, glutes, and hold. Think about digging through your heels, squeezing your quads, and keeping everything nice and tight.\n6. Repeat.", animation: "t-plank-exercise")
    
    ]
    var  model34 : [plan] = [
    
        
            .init(name: "Jumping Jack", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Stand upright with your legs together, arms at your sides.\n2. Bend your knees slightly, and jump into the air.\n3. As you jump, spread your legs to be about shoulder-width apart. Stretch your arms out and over your head.\n4. Jump back to starting position.\n5. Repeat for 30 Times.", animation: "jumping-jack"),
            .init(name: "Squat Reach", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Keep your feet shoulder-width apart and perform a squat by bending at the knees to lower yourself downwards\n2. Your knees should not pass over your toes\n3. From the squat position, straighten and jump upwards, reaching both arms forward.\n4. Repeat.", animation: "squat-reach"),
            .init(name: "Squats Kicks", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Start with your feet about shoulder width apart.\n2. Bend at the knees and drop your butt down till your legs make a 90 degree angle.\n3. Stand back up and kick forward with you right leg (alternate kicking legs each repetition).\n4. This completes one repetition.", animation: "squat-kick"),
            .init(name: "Staggered Puchups", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Get into a press-up position with your hands staggered, so your right is further forward then the left.\n2.  Lower your body until your chest is an inch from the ground then drive up explosively.\n3. Pull your hands off the floor and switch positions so your left leads.\n4. repeat.", animation: "staggered-push-ups"),
            .init(name: "Military Pushups", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Start in a high plank position with your hands flat on the floor about shoulder-width apart, wrists under shoulders.\n2. Turn your elbows so that they are facing behind you.\n3. \n4. Keeping your body in one long line, bend your arms and lower yourself as close to the floor as you can.\n5. Keep your arms close to your torso as you perform the movement.Push back up to start.\n6. Repeat.", animation: "military-push-ups"),
            .init(name: "Shoulder Stretch", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Stand in a doorway and place one arm against the door frame. Your elbow should be a little higher than your shoulder.\n2. Relax your shoulders as you lean forward, allowing your chest and shoulder muscles to stretch. ...\n3. Hold for 15 to 30 seconds.\n4. Repeat 2 to 4 times with each arm.", animation: "shoulder-stretch")
    
    ]
    var  model35 : [plan] = [
    
        .init(name: "Shoulder Stretch", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Stand in a doorway and place one arm against the door frame. Your elbow should be a little higher than your shoulder.\n2. Relax your shoulders as you lean forward, allowing your chest and shoulder muscles to stretch. ...\n3. Hold for 15 to 30 seconds.\n4. Repeat 2 to 4 times with each arm.", animation: "shoulder-stretch"),
        .init(name: "Seated Abs Ciricles", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1.Seated.\n2. leaning back with hands planted on the ground.\n3. Now, You’ll just make clockwise circles and counterclockwise circles with your legs.\n4. Repeat.", animation: "seated-abs-circles"),
        .init(name: "Everse Crunches", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Lie face-up on a mat or other soft surface with your knees bent at 90 degrees and your feet flat on the floor. Keep your arms near your sides with your palms down.\n2. Exhale and brace your core. Lift your feet off the ground and raise your thighs until they’re vertical. Keep your knees bent at 90 degrees throughout the movement.\n3. Tuck your knees toward your face as far as you can comfortably go without lifting your mid-back from the mat. Your hips and lower back should lift off the ground.\n4. Hold for a moment and slowly lower your feet back toward the floor until they reach the ground.\n5. Repeat for at least 10-12 repetitions. Do one set to start, and increase the number of reps and sets as you get stronger.", animation: "everse-crunches"),
        .init(name: "Staggered Pushups", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Get into a press-up position with your hands staggered, so your right is further forward then the left.\n2.  Lower your body until your chest is an inch from the ground then drive up explosively.\n3. Pull your hands off the floor and switch positions so your left leads.\n4. repeat.", animation: "staggered-push-ups"),
        .init(name: "Military Pushups", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Start in a high plank position with your hands flat on the floor about shoulder-width apart, wrists under shoulders.\n2. Turn your elbows so that they are facing behind you.\n3. \n4. Keeping your body in one long line, bend your arms and lower yourself as close to the floor as you can.\n5. Keep your arms close to your torso as you perform the movement.Push back up to start.\n6. Repeat.", animation: "military-push-ups"),
        .init(name: "T Planks", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Start on the floor on your hands and knees.\n2. Place your hands directly under your shoulders.\n3. Step your feet back, one at a time. (For more stability, bring your feet wider than hip-distance apart, and bring them closer for more of a challenge.)\n4. Maintain a straight line from the top of your head through your heels, gaze down just above your fingertips.\n5. Now, tighten your abs, quads, glutes, and hold. Think about digging through your heels, squeezing your quads, and keeping everything nice and tight.\n6. Repeat.", animation: "t-plank-excercise")
    
    ]
    var  model36 : [plan] = [
        .init(name: "Skipping", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Keep your feet close together when jumping.\n2. Jump on the midsoles of your feet and land softly\n3. Keep your jumping height low (½” - 1” off the ground)\n4. Keep your knees slightly bent at all times\n5. Maintain a tall, neutral spine\n6. Keep your head up, chest up, and head looking forward\n7. Keep your shoulders pulled back and your elbows held down and back\n8. Keep your hands along the midline of your body\n9. Use your wrists to turn the rope (not your elbows or shoulders)\n10. Repeat.", animation: "skipping"),
        .init(name: "Jumping Jack", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Stand upright with your legs together, arms at your sides.\n2. Bend your knees slightly, and jump into the air.\n3. As you jump, spread your legs to be about shoulder-width apart. Stretch your arms out and over your head.\n4. Jump back to starting position.\n5. Repeat for 30 Times.", animation: "jumping-jack"),
        .init(name: "Punches", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Stand with your feet hip-width apart, your knees slightly bent, and hold a dumbbell in each hand.\n2. Take a step forward with your left foot, keep your back foot at a 45-degree angle and position your body partially sideways.\n3. Bring your arms up, so that the palms of the hands are facing the sides of the face.\n4. Push your right arm out in a punching motion and then return to the starting position.\n5. Switch sides and repeat.", animation: "punches"),
        .init(name: "Squat Kick", image: "ls1", calories: "23.2cal", steps: "STEPS: \n\n1. Start with your feet about shoulder width apart.\n2. Bend at the knees and drop your butt down till your legs make a 90 degree angle.\n3. Stand back up and kick forward with you right leg (alternate kicking legs each repetition).\n4. This completes one repetition.", animation: "squat-kick"),
        .init(name: "Step up on Chair", image: "ls1", calories: "24.7cal", steps: "STEPS: \n\n1. Walkup to the chair with chair-sit facing in front of you.\n2. You should be 2 feet away from the chair.\n3. Next, take your right foot, step up and continue looking all the straight ahead and then stay back down.\n4. Similarly, switch legs, step back up and come down.\n5. Repeat.", animation: "step-up-on-chair"),
        .init(name: "Single hip leg rotation", image: "ls1", calories: "34.1cal", steps: "STEPS: \n\n1. Raise your right knee until your thigh is parallel to the floor.\n2. Move it out to the side, and then rotate your thigh so your shin is parallel to the floor behind you.\n3. Revert to the start and repeat in reverse.\n4. Repeat with your left leg", animation: "single-leg-hip-rotation")
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.load()
        if answer1 == "Beginner"{
            type = 1
        }else if ( answer1 == "Intermidate"){
            type = 2
        }else if (answer1 == "Advanced"){
            type = 3
        }
    }
    
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       
        if segue.identifier == "identifier"{
            let destinationVC = segue.destination as! dayWorkoutPlan
            if type == 1{
                if count == 1{
                    destinationVC.model = model
                }else if count == 2{
                    destinationVC.model = model2
                }else if count == 3{
                    destinationVC.model = model3
                }else if count == 4{
                    destinationVC.model = model4
                }else if count == 5{
                    destinationVC.model = model5
                }else{
                    destinationVC.model = model6
                }
                
            }else if ( type == 2){
                if count == 1{
                    destinationVC.model = model21
                }else if count == 2{
                    destinationVC.model = model22
                }else if count == 3{
                    destinationVC.model = model23
                }else if count == 4{
                    destinationVC.model = model24
                }else if count == 5{
                    destinationVC.model = model25
                }else{
                    destinationVC.model = model26
                }
                
            }else{
                if count == 1{
                    destinationVC.model = model31
                }else if count == 2{
                    destinationVC.model = model32
                }else if count == 3{
                    destinationVC.model = model33
                }else if count == 4{
                    destinationVC.model = model34
                }else if count == 5{
                    destinationVC.model = model35
                }else{
                    destinationVC.model = model36
                }
            }
            
            
            
        }
        
    }
    /*
    private func load(){
        db.collection("user").getDocuments { [self] (querySnapshot , error) in
            if error != nil{
                print("Error while loading saved data.")
            }else{
                if let snapshotDocuments = querySnapshot?.documents{
                    for doc in snapshotDocuments{
                        let data = doc.data()
                        print(Auth.auth().currentUser?.email)
                        if data["sender"] as! String  == Auth.auth().currentUser?.email {
                            
                            answer1 = data["selectedOption1"] as! String
                            answer2 = data["selectedOption2"] as! String
                            answer3 =  data["selectedOption3"] as! String
  
                        }
                        
                    }
                    performSegue(withIdentifier: "identifier", sender: self)
                }
            }
        }
        
        if answer1 == "Bignner"{
            type = 1
        }else if ( answer1 == "Intermidate"){
            type = 2
        }else{
            type = 3
        }
    }*/
    
    func load(){
        answer1 = vc.exercise
        answer2 = vc.physique
        answer3 = vc.time
        /*
         Beginner", option2: "Intermidate", option3: "Advanced
         */
        
    }
      
    @IBAction func dayOnePressed(_ sender: UIButton) {
        count = 1
        print("Day1 routine")
        performSegue(withIdentifier: "identifier", sender: self)
    }
    @IBAction func dayTwoPressed(_ sender: UIButton) {
        count = 2
        print("Day2 routine")
        performSegue(withIdentifier: "identifier", sender: self)
    }
    @IBAction func dayThreePressed(_ sender: UIButton) {
        count = 3
        print("Day3 routine")
        performSegue(withIdentifier: "identifier", sender: self)
    }
    @IBAction func dayFourPressed(_ sender: UIButton) {
        count = 4
        print("Day4 routine")
        performSegue(withIdentifier: "identifier", sender: self)
    }
    @IBAction func dayFivePressed(_ sender: UIButton) {
        count = 5
        print("Day5 routine")
        performSegue(withIdentifier: "identifier", sender: self)
    }
    @IBAction func daySixPressed(_ sender: UIButton) {
        count = 6
        print("Day6 routine")
        performSegue(withIdentifier: "identifier", sender: self)
    }
    
 /*
  if let snapshotDocuments = querySnapshot?.documents{
      for doc in snapshotDocuments{
          let data = doc.data()
          print(Auth.auth().currentUser?.email)
          if data["sender"] as! String  == Auth.auth().currentUser?.email {
              c += 1
              let  totalItem = (data["price"] as! NSString).doubleValue
                  count += totalItem
                  print("total amount = \(count)")
              
              
              
            
          }
  */
    
    
}
    

/*
1. Inside the asssigment get all the data
 2. Based on the data design a quiz like analysis func and then create 2 array where each array as the workout plan diffrently based the defined bady type.
 */


