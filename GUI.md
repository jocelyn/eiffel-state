## Introduction ##

Proper GUI design is critical for the success of a visual software construction tool. People hate using them because the interface of any text editor, even the worst one, is typically still better than the interface of the world's best visual editor. Our goal is to design the interface of our visual editor in such a way that it will be easier to draw an STD in it than to draw STD on a piece of paper and then translate it into code using text editor.

## Criteria ##

Our main criterion when developing the user interface is _efficiency_, which is defined by the amount of time that the user needs to accomplish his task. Efficiency can be measured either through an experiment or by modeling the user's behavior.

_Visibility_ — the ability of novice users to use the interface without reading the manual — is also a useful property, but it is secondary for us as the tool is targeted to long-term, frequent usage.

## Approach ##

We consider to use following **Position-based approach** to the GUI design. This approach is suitable since we have very few element types on our diagrams:
  * Entry-point (already on diagram)
  * State(s)
  * Transition(s)
That's why we can easily guess what the user wants to draw basing on cursor position.

## Details of the position-based approach ##

Position-based approach can, for example, look like this:
  * If the cursor is over free space it has a shape of a state and pressing the left (?) mouse button results in creating a new state.
  * If cursor is close to the border of an existing state, the state is highlighted. If then a mouse button is pressed, a transition from this state is created. An analogue of EiffelStudio Pick-and-Drop mechanism can be used, i.e. right-click creates the transition, then on mouse movement the line for the transition is continuously shown, then the second right-click on target state border finishes the transition creation. Left-click cancels the transition creation. On the advantages of Pick-and-Drop over Drag-and-Drop read Eiffel Studio documentation.
  * Clicking in some special (visible) areas will result in editing state name or transition label. It probably makes sense also to automatically switch to editing this information after state/transition creation, because this is how people draw STD on paper. With respect to editing text and efficiency, moving hands from mouse to keyboard is the main issue.
  * The last, but not the least important, moment is that when we start to edit diagram there is already an **entry-point**. This entry-point is non-existence and describes the universe without this object. Transitions from entry-point can lead to different real states and on those transitions only the creation procedures and their arguments can be used in conditions.