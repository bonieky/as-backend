-- CreateTable
CREATE TABLE "Event" (
    "id" SERIAL NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT false,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "grouped" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Event_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EventGroup" (
    "id" SERIAL NOT NULL,
    "id_event" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "EventGroup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EventPeople" (
    "id" SERIAL NOT NULL,
    "id_event" INTEGER NOT NULL,
    "id_group" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "matched" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "EventPeople_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "EventGroup" ADD CONSTRAINT "EventGroup_id_event_fkey" FOREIGN KEY ("id_event") REFERENCES "Event"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EventPeople" ADD CONSTRAINT "EventPeople_id_event_fkey" FOREIGN KEY ("id_event") REFERENCES "Event"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EventPeople" ADD CONSTRAINT "EventPeople_id_group_fkey" FOREIGN KEY ("id_group") REFERENCES "EventGroup"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
