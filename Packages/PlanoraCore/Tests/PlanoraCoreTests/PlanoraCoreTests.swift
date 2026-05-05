import Testing
import Foundation
@testable import PlanoraCore

struct PlanoraCoreTests {
    
    @Test func durationCalculatedCorrectly() {
        let start = Date()
        let end = start.addingTimeInterval(3600)  // 3600 seconds = 60 minutes
        let meeting = Meeting(
            id: "test-1",
            title: "Standup",
            startDate: start,
            endDate: end,
            attendeeNames: ["Alice", "Bob"]
        )
        #expect(meeting.duration == 60)
    }
    
    @Test func actionItemDefaultsToUnconfirmed() {
        let item = ActionItem(
            text: "Follow up with client",
            speaker: "Alice",
            confidence: 0.9
        )
        #expect(item.isConfirmed == false)
        #expect(item.confidence == 0.9)
    }
    
    @Test func transcriptChunksGetUniqueIDs() {
        let c1 = TranscriptChunk(text: "Hello", isFinal: false, timestamp: Date())
        let c2 = TranscriptChunk(text: "World", isFinal: true, timestamp: Date())
        #expect(c1.id != c2.id)
    }
    
    @Test func briefingDecodesFromJSON() throws {
        let json = """
        {
            "meetingID": "abc-123",
            "know": ["Revenue is down 10%", "CEO wants answers"],
            "questions": ["What caused the drop?"],
            "decision": "Budget cuts likely",
            "generatedAt": 0
        }
        """
        let data = Data(json.utf8)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let briefing = try decoder.decode(Briefing.self, from: data)
        #expect(briefing.know.count == 2)
        #expect(briefing.meetingID == "abc-123")
    }
}
