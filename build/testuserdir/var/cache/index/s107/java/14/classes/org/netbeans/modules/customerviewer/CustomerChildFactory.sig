����   2 �
  S
 $ T	  U V W X Y X Z [ V \ ]	 ^ _
 ` a
 	 b
  c
 d e
  f
 d g h
 i j k l m n o p
 q r m s m t o u v w
 x c
 y z	 { | } ~
 y  o �
  � � InnerClasses 
resultList Ljava/util/List; 	Signature !Ljava/util/List<Ldemo/Customer;>; <init> (Ljava/util/List;)V Code LineNumberTable LocalVariableTable this :Lorg/netbeans/modules/customerviewer/CustomerChildFactory; LocalVariableTypeTable $(Ljava/util/List<Ldemo/Customer;>;)V 
createKeys (Ljava/util/List;)Z customer Ldemo/Customer; list StackMapTable � $(Ljava/util/List<Ldemo/Customer;>;)Z #org.netbeans.SourceLevelAnnotations Ljava/lang/Override; createNodeForKey )(Ldemo/Customer;)Lorg/openide/nodes/Node; c node Lorg/openide/nodes/Node; deleteCustomer (I)Z toDelete e Ljava/lang/Exception; 
customerId I entityManager !Ljavax/persistence/EntityManager; � v ,(Ljava/lang/Object;)Lorg/openide/nodes/Node; 
access$000 x0 1Lorg/openide/nodes/ChildFactory<Ldemo/Customer;>; 
SourceFile CustomerChildFactory.java B C * � & ' � � � � � � � � demo/Customer � � :org/netbeans/modules/customerviewer/CustomerChildFactory$1 � � � � � � * � � � � � � � � � � CustomerDBAccessPU � � � � � � � � � � � � � � � � � � � � � java/lang/Exception 8org/netbeans/modules/customerviewer/CustomerChildFactory � � � � � � � 0Cannot delete a customer with id {0}, cause: {1} java/lang/Object � � � � = > org/openide/nodes/ChildFactory java/util/Iterator javax/persistence/EntityManager ()V java/util/List iterator ()Ljava/util/Iterator; hasNext ()Z next ()Ljava/lang/Object; add (Ljava/lang/Object;)Z org/openide/nodes/Children LEAF Lorg/openide/nodes/Children; org/openide/util/lookup/Lookups 	singleton -(Ljava/lang/Object;)Lorg/openide/util/Lookup; r(Lorg/netbeans/modules/customerviewer/CustomerChildFactory;Lorg/openide/nodes/Children;Lorg/openide/util/Lookup;)V getName ()Ljava/lang/String; org/openide/nodes/Node setDisplayName (Ljava/lang/String;)V getCity setShortDescription javax/persistence/Persistence createEntityManagerFactory <(Ljava/lang/String;)Ljavax/persistence/EntityManagerFactory; &javax/persistence/EntityManagerFactory createEntityManager #()Ljavax/persistence/EntityManager; getTransaction '()Ljavax/persistence/EntityTransaction; #javax/persistence/EntityTransaction begin java/lang/Integer valueOf (I)Ljava/lang/Integer; find 7(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object; remove (Ljava/lang/Object;)V commit java/lang/Class java/util/logging/Logger 	getLogger .(Ljava/lang/String;)Ljava/util/logging/Logger; java/util/logging/Level WARNING Ljava/util/logging/Level; log A(Ljava/util/logging/Level;Ljava/lang/String;[Ljava/lang/Object;)V rollback !  $     & '  (    )   * +  ,   X     
*� *+� �    -       C  D 	 E .       
 / 0     
 & '  1       
 & )  (    2  3 4  ,   �     **� �  M,�  � ,�  � N+-�  W����    -       I  J % K ( L .        5 6    * / 0     * 7 '  1       * 7 )  8    � 
 9�  (    : ;     <    = >  ,   l     "� 	Y*� 
+� � M,+� � ,+� � ,�    -       Q  k  l   m .        " / 0     " ? 6    @ A  ;     <   
 B C  ,   �     h� �  L+�  �  +� �  � M+,�  +�  �  � .M� � � �  Y� SY,S� !+�  � " �   8 ;   -   2    q  r  t & u - w 8 | ; x < y P z X y [ { f } .   *  &  D 6  < * E F    h G H    ] I J  8    � ;  K  L*D = M  ,   3     	*+� � #�    -       ? .       	 / 0   ;     <   N C  ,   /     � �    -       ? .        O H    (    P Q    R %   
  	      